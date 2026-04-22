from __future__ import annotations

import argparse
import base64
import json
from pathlib import Path

from cryptography.hazmat.primitives.ciphers.aead import AESGCM


MAGIC = b"AESGCM1"
NONCE_LEN = 12


def load_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def find_entry(manifest: dict, instance: str, database: str) -> dict:
    for entry in manifest.get("backups", []):
        if entry.get("instance") == instance and entry.get("database") == database:
            return entry
    raise SystemExit(f"Backup not found for instance={instance!r} database={database!r}")


def read_encrypted_blob(base_dir: Path, storage: dict) -> bytes:
    mode = storage.get("mode")
    if mode == "single":
        return (base_dir / storage["file"]).read_bytes()
    if mode == "split":
        chunks = []
        for part in storage.get("parts", []):
            chunks.append((base_dir / part["file"]).read_bytes())
        return b"".join(chunks)
    raise SystemExit(f"Unsupported storage mode: {mode!r}")


def decrypt_blob(blob: bytes, key: bytes) -> bytes:
    if not blob.startswith(MAGIC):
        raise SystemExit("Invalid backup format: missing AESGCM1 magic header")
    nonce_start = len(MAGIC)
    nonce_end = nonce_start + NONCE_LEN
    nonce = blob[nonce_start:nonce_end]
    ciphertext = blob[nonce_end:]
    aesgcm = AESGCM(key)
    return aesgcm.decrypt(nonce, ciphertext, None)


def main() -> None:
    parser = argparse.ArgumentParser(description="Decrypt a database backup from manifest.json")
    parser.add_argument("--manifest", required=True, help="Path to manifest.json")
    parser.add_argument("--instance", required=True, help="Backup instance name, e.g. postgres, supabase, piwigo")
    parser.add_argument("--database", required=True, help="Database name, e.g. evolution, postgres, piwigodb")
    parser.add_argument("--key-file", required=True, help="Path to the base64 AES-GCM key file")
    parser.add_argument("--output", required=True, help="Path for the decrypted output file")
    args = parser.parse_args()

    manifest_path = Path(args.manifest).resolve()
    key_file = Path(args.key_file).resolve()
    output_path = Path(args.output).resolve()

    manifest = load_manifest(manifest_path)
    entry = find_entry(manifest, args.instance, args.database)
    blob = read_encrypted_blob(manifest_path.parent, entry["storage"])
    key = base64.urlsafe_b64decode(key_file.read_text(encoding="utf-8").strip().encode("ascii"))
    plaintext = decrypt_blob(blob, key)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_bytes(plaintext)
    print(f"Wrote decrypted backup to {output_path}")


if __name__ == "__main__":
    main()
