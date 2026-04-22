--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA _realtime;


--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: pg_cron; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pg_cron; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_cron IS 'Job scheduler for PostgreSQL';


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: pgmq; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgmq;


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA supabase_functions;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: pgmq; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgmq WITH SCHEMA pgmq;


--
-- Name: EXTENSION pgmq; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgmq IS 'A lightweight message queue. Like AWS SQS and RSMQ but on Postgres.';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: wrappers; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS wrappers WITH SCHEMA extensions;


--
-- Name: EXTENSION wrappers; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION wrappers IS 'Foreign data wrappers developed by Supabase';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: app_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.app_role AS ENUM (
    'admin',
    'moderator',
    'user',
    'secretary'
);


--
-- Name: TYPE app_role; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.app_role IS 'Application roles: admin (full access), manager (event/spaces management), user (basic access)';


--
-- Name: estado_civil_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.estado_civil_enum AS ENUM (
    'Solteiro(a)',
    'Casado(a)',
    'Divorciado(a)',
    'Viúvo(a)',
    'Outro'
);


--
-- Name: frequenta_igreja_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.frequenta_igreja_enum AS ENUM (
    'Sim',
    'Não',
    'Às vezes'
);


--
-- Name: ifc_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.ifc_role AS ENUM (
    'pastor',
    'secretaria',
    'lider',
    'membro',
    'midia'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select
        rolname::text,
        case when rolvaliduntil < now()
            then null
            else rolpassword::text
        end
    from pg_authid
    where rolname=$1 and rolcanlogin;
end;
$_$;


--
-- Name: app_contacts_sync_normalized_phone(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_contacts_sync_normalized_phone() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  new.normalized_phone := public.app_normalize_phone_number(new.phone_number);
  if new.owner_user_id is null then
    new.owner_user_id := public.app_primary_owner_uid();
  end if;
  return new;
end;
$$;


--
-- Name: app_create_scheduled_dispatch(text, text, text, text, timestamp with time zone, timestamp with time zone, integer, jsonb, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_create_scheduled_dispatch(p_instance_name text, p_flow_type text, p_name text, p_timezone text, p_scheduled_for_utc timestamp with time zone, p_misfire_deadline_utc timestamp with time zone, p_throttle_ms integer, p_message_blocks jsonb, p_targets_snapshot jsonb) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'auth'
    AS $$
declare
  v_owner_user_id uuid := auth.uid();
  v_job_id uuid;
begin
  if v_owner_user_id is null then
    raise exception 'Authentication required to create scheduled dispatch.' using errcode = '28000';
  end if;

  insert into public.app_dispatch_jobs (
    owner_user_id,
    instance_name,
    flow_type,
    send_mode,
    recurrence_rule_id,
    name,
    timezone,
    scheduled_for_utc,
    misfire_deadline_utc,
    status,
    throttle_ms,
    message_blocks,
    targets_snapshot,
    total_recipients,
    sent_recipients,
    failed_recipients,
    cancelled_recipients,
    expired_recipients,
    error_message,
    worker_id,
    started_at,
    completed_at,
    created_at,
    updated_at
  )
  values (
    v_owner_user_id,
    trim(coalesce(p_instance_name, '')),
    trim(coalesce(p_flow_type, '')),
    'scheduled',
    null,
    trim(coalesce(p_name, '')),
    coalesce(nullif(trim(coalesce(p_timezone, '')), ''), 'America/Sao_Paulo'),
    p_scheduled_for_utc,
    p_misfire_deadline_utc,
    'queued',
    greatest(coalesce(p_throttle_ms, 10000), 10000),
    coalesce(p_message_blocks, '[]'::jsonb),
    coalesce(p_targets_snapshot, '[]'::jsonb),
    case
      when jsonb_typeof(coalesce(p_targets_snapshot, '[]'::jsonb)) = 'array' then jsonb_array_length(coalesce(p_targets_snapshot, '[]'::jsonb))
      else 0
    end,
    0,
    0,
    0,
    0,
    null,
    null,
    null,
    null,
    now(),
    now()
  )
  returning id into v_job_id;

  insert into public.app_dispatch_job_items (
    owner_user_id,
    job_id,
    sequence,
    label,
    target,
    kind,
    source,
    status,
    sent_at,
    error_message,
    created_at,
    updated_at
  )
  select
    v_owner_user_id,
    v_job_id,
    source.ordinality::integer - 1,
    coalesce(nullif(trim(source.value ->> 'label'), ''), trim(source.value ->> 'target')),
    trim(source.value ->> 'target'),
    coalesce(nullif(trim(source.value ->> 'kind'), ''), 'manual'),
    nullif(trim(source.value ->> 'source'), ''),
    'pending',
    null,
    null,
    now(),
    now()
  from jsonb_array_elements(
    case
      when jsonb_typeof(coalesce(p_targets_snapshot, '[]'::jsonb)) = 'array' then coalesce(p_targets_snapshot, '[]'::jsonb)
      else '[]'::jsonb
    end
  ) with ordinality as source(value, ordinality)
  where trim(coalesce(source.value ->> 'target', '')) <> '';

  return v_job_id;
end;
$$;


--
-- Name: app_crm_acquire_lock(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_crm_acquire_lock(p_lock_owner text, p_ttl_seconds integer DEFAULT 120) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  v_now timestamptz := now();
  v_lock_until timestamptz := v_now + make_interval(secs => greatest(coalesce(p_ttl_seconds, 120), 30));
  v_updated integer := 0;
begin
  insert into public.app_crm_runtime_lock (lock_key, lock_owner, lock_until_utc, updated_at)
  values ('crm_sync_worker', p_lock_owner, v_lock_until, v_now)
  on conflict (lock_key) do nothing;

  update public.app_crm_runtime_lock
     set lock_owner = p_lock_owner,
         lock_until_utc = v_lock_until,
         updated_at = v_now
   where lock_key = 'crm_sync_worker'
     and (
       lock_until_utc is null
       or lock_until_utc < v_now
       or lock_owner = p_lock_owner
     );

  get diagnostics v_updated = row_count;
  return v_updated > 0;
end;
$$;


--
-- Name: app_crm_heartbeat_lock(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_crm_heartbeat_lock(p_lock_owner text, p_ttl_seconds integer DEFAULT 120) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  v_now timestamptz := now();
  v_lock_until timestamptz := v_now + make_interval(secs => greatest(coalesce(p_ttl_seconds, 120), 30));
  v_updated integer := 0;
begin
  update public.app_crm_runtime_lock
     set lock_until_utc = v_lock_until,
         updated_at = v_now
   where lock_key = 'crm_sync_worker'
     and lock_owner = p_lock_owner;

  get diagnostics v_updated = row_count;
  return v_updated > 0;
end;
$$;


--
-- Name: app_crm_release_lock(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_crm_release_lock(p_lock_owner text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  v_updated integer := 0;
begin
  update public.app_crm_runtime_lock
     set lock_owner = null,
         lock_until_utc = null,
         updated_at = now()
   where lock_key = 'crm_sync_worker'
     and lock_owner = p_lock_owner;

  get diagnostics v_updated = row_count;
  return v_updated > 0;
end;
$$;


--
-- Name: app_dispatch_acquire_lock(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_dispatch_acquire_lock(p_lock_owner text, p_ttl_seconds integer DEFAULT 90) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  v_now timestamptz := now();
  v_lock_until timestamptz := v_now + make_interval(secs => greatest(coalesce(p_ttl_seconds, 90), 30));
  v_updated integer := 0;
begin
  insert into public.app_dispatch_runtime_lock (lock_key, lock_owner, lock_until_utc, updated_at)
  values ('dispatch_worker', p_lock_owner, v_lock_until, v_now)
  on conflict (lock_key) do nothing;

  update public.app_dispatch_runtime_lock
     set lock_owner = p_lock_owner,
         lock_until_utc = v_lock_until,
         updated_at = v_now
   where lock_key = 'dispatch_worker'
     and (
       lock_until_utc is null
       or lock_until_utc < v_now
       or lock_owner = p_lock_owner
     );

  get diagnostics v_updated = row_count;
  return v_updated > 0;
end;
$$;


--
-- Name: app_dispatch_heartbeat_lock(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_dispatch_heartbeat_lock(p_lock_owner text, p_ttl_seconds integer DEFAULT 90) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  v_now timestamptz := now();
  v_lock_until timestamptz := v_now + make_interval(secs => greatest(coalesce(p_ttl_seconds, 90), 30));
  v_updated integer := 0;
begin
  update public.app_dispatch_runtime_lock
     set lock_until_utc = v_lock_until,
         updated_at = v_now
   where lock_key = 'dispatch_worker'
     and lock_owner = p_lock_owner;

  get diagnostics v_updated = row_count;
  return v_updated > 0;
end;
$$;


--
-- Name: app_dispatch_release_lock(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_dispatch_release_lock(p_lock_owner text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  v_updated integer := 0;
begin
  update public.app_dispatch_runtime_lock
     set lock_owner = null,
         lock_until_utc = null,
         updated_at = now()
   where lock_key = 'dispatch_worker'
     and lock_owner = p_lock_owner;

  get diagnostics v_updated = row_count;
  return v_updated > 0;
end;
$$;


--
-- Name: app_normalize_phone_number(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_normalize_phone_number(raw_value text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
  select regexp_replace(coalesce(raw_value, ''), '\\D', '', 'g');
$$;


--
-- Name: app_primary_owner_uid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_primary_owner_uid() RETURNS uuid
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'auth'
    AS $$
declare
  v_uid uuid;
  v_primary_email text := coalesce(nullif(current_setting('app.primary_owner_email', true), ''), 'pastorfilipeivopereira@gmail.com');
begin
  v_uid := auth.uid();
  if v_uid is not null then
    return v_uid;
  end if;

  select id
    into v_uid
    from auth.users
   where email = v_primary_email
   order by created_at asc
   limit 1;

  if v_uid is not null then
    return v_uid;
  end if;

  select id
    into v_uid
    from auth.users
   order by created_at asc
   limit 1;

  return v_uid;
end;
$$;


--
-- Name: app_set_owner_user_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_set_owner_user_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if new.owner_user_id is null then
    new.owner_user_id := public.app_primary_owner_uid();
  end if;
  return new;
end;
$$;


--
-- Name: app_storage_path_belongs_to_owner(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.app_storage_path_belongs_to_owner(object_name text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  select auth.uid() is not null and split_part(coalesce(object_name, ''), '/', 1) = auth.uid()::text;
$$;


--
-- Name: can_manage_documents(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.can_manage_documents() RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'auth'
    AS $$
begin
  if auth.uid() is null then
    return false;
  end if;

  if to_regclass('public.ifc_user_roles') is not null then
    if exists (
      select 1
      from public.ifc_user_roles
      where user_id = auth.uid()
        and lower(role::text) in ('pastor', 'secretaria')
    ) then
      return true;
    end if;
  end if;

  begin
    if exists (
      select 1
      from public.profiles
      where id = auth.uid()
        and lower(coalesce(role::text, '')) in ('pastor', 'secretaria', 'admin', 'secretary')
    ) then
      return true;
    end if;
  exception
    when undefined_column then
      null;
  end;

  begin
    if exists (
      select 1
      from auth.users
      where id = auth.uid()
        and lower(coalesce(raw_user_meta_data ->> 'role', '')) in ('pastor', 'secretaria', 'admin', 'secretary')
    ) then
      return true;
    end if;
  exception
    when undefined_table then
      null;
  end;

  return false;
end;
$$;


--
-- Name: can_manage_institutional_content(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.can_manage_institutional_content() RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  has_ifc_roles boolean;
begin
  select to_regprocedure('public.ifc_has_role(uuid,text)') is not null into has_ifc_roles;

  if auth.uid() is null then
    return false;
  end if;

  if has_ifc_roles then
    return
      public.ifc_has_role(auth.uid(), 'pastor')
      or public.ifc_has_role(auth.uid(), 'secretaria');
  end if;

  return false;
end;
$$;


--
-- Name: can_manage_photos(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.can_manage_photos() RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
begin
  if auth.uid() is null then
    return false;
  end if;

  return
    public.ifc_has_role(auth.uid(), 'pastor')
    or public.ifc_has_role(auth.uid(), 'secretaria')
    or public.ifc_has_role(auth.uid(), 'midia');
end;
$$;


--
-- Name: can_manage_site_ifc(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.can_manage_site_ifc() RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public', 'auth'
    AS $$
begin
  if auth.uid() is null then
    return false;
  end if;

  if to_regclass('public.ifc_user_roles') is not null then
    if exists (
      select 1
      from public.ifc_user_roles
      where user_id = auth.uid()
        and lower(role::text) in ('pastor', 'secretaria')
    ) then
      return true;
    end if;
  end if;

  begin
    if exists (
      select 1
      from public.profiles
      where id = auth.uid()
        and lower(coalesce(role::text, '')) in ('pastor', 'secretaria', 'admin', 'secretary')
    ) then
      return true;
    end if;
  exception
    when undefined_column then
      null;
  end;

  begin
    if exists (
      select 1
      from auth.users
      where id = auth.uid()
        and lower(coalesce(raw_user_meta_data ->> 'role', '')) in ('pastor', 'secretaria', 'admin', 'secretary')
    ) then
      return true;
    end if;
  exception
    when undefined_table then
      null;
  end;

  return false;
end;
$$;


--
-- Name: can_write(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.can_write() RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  -- Admins e Secretárias podem escrever
  RETURN EXISTS (
    SELECT 1 FROM public.user_roles ur
    WHERE ur.user_id = auth.uid()
    AND ur.role IN ('admin', 'secretary')
  );
END;
$$;


--
-- Name: create_new_user(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.create_new_user(p_email text, p_password text, p_role text DEFAULT 'user'::text) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'auth', 'extensions'
    AS $$
DECLARE
  v_user_id uuid;
  v_encrypted_password text;
  v_instance_id uuid := '00000000-0000-0000-0000-000000000000';
BEGIN
  -- Verificar se quem está chamando é admin
  IF NOT EXISTS (
    SELECT 1 FROM public.user_roles ur
    WHERE ur.user_id = auth.uid()
    AND ur.role = 'admin'
  ) THEN
    RETURN json_build_object('error', 'Apenas administradores podem criar usuários');
  END IF;

  -- Verificar se email já existe
  IF EXISTS (SELECT 1 FROM auth.users WHERE email = p_email) THEN
    RETURN json_build_object('error', 'Email já cadastrado');
  END IF;

  -- Gerar ID e hash da senha usando extensions.crypt
  v_user_id := gen_random_uuid();
  v_encrypted_password := extensions.crypt(p_password, extensions.gen_salt('bf'));

  -- Inserir usuário na tabela auth.users
  INSERT INTO auth.users (
    id,
    instance_id,
    email,
    encrypted_password,
    email_confirmed_at,
    created_at,
    updated_at,
    raw_app_meta_data,
    raw_user_meta_data,
    aud,
    role,
    confirmation_token,
    recovery_token
  ) VALUES (
    v_user_id,
    v_instance_id,
    p_email,
    v_encrypted_password,
    now(),
    now(),
    now(),
    '{"provider": "email", "providers": ["email"]}'::jsonb,
    '{}'::jsonb,
    'authenticated',
    'authenticated',
    '',
    ''
  );

  -- Inserir identity (necessário para login funcionar)
  INSERT INTO auth.identities (
    id,
    provider_id,
    user_id,
    identity_data,
    provider,
    last_sign_in_at,
    created_at,
    updated_at
  ) VALUES (
    gen_random_uuid(),
    v_user_id::text,
    v_user_id,
    jsonb_build_object('sub', v_user_id::text, 'email', p_email, 'email_verified', true),
    'email',
    now(),
    now(),
    now()
  );

  -- Inserir role
  INSERT INTO public.user_roles (user_id, role)
  VALUES (v_user_id, p_role::app_role);

  RETURN json_build_object(
    'success', true,
    'user_id', v_user_id,
    'email', p_email,
    'role', p_role
  );

EXCEPTION WHEN OTHERS THEN
  RETURN json_build_object('error', SQLERRM);
END;
$$;


--
-- Name: document_files_apply_defaults(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.document_files_apply_defaults() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
begin
  new.name := trim(regexp_replace(coalesce(new.name, ''), '\s+', ' ', 'g'));
  new.normalized_name := public.document_normalize_name(new.name);
  new.updated_at := now();

  if tg_op = 'INSERT' then
    new.created_at := coalesce(new.created_at, now());
    new.updated_at := coalesce(new.updated_at, new.created_at);
    new.uploaded_by := coalesce(new.uploaded_by, auth.uid());
  else
    new.uploaded_by := coalesce(auth.uid(), new.uploaded_by);
  end if;

  return new;
end;
$$;


--
-- Name: document_folder_prevent_cycles(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.document_folder_prevent_cycles() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
declare
  cursor_parent uuid;
begin
  if new.parent_folder_id is null then
    return new;
  end if;

  if new.parent_folder_id = new.id then
    raise exception 'Uma pasta não pode ser movida para dentro dela mesma.';
  end if;

  cursor_parent := new.parent_folder_id;

  while cursor_parent is not null loop
    if cursor_parent = new.id then
      raise exception 'Uma pasta não pode ser movida para dentro de uma subpasta descendente.';
    end if;

    select parent_folder_id
      into cursor_parent
    from public.app_document_folders
    where id = cursor_parent;
  end loop;

  return new;
end;
$$;


--
-- Name: document_folders_apply_defaults(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.document_folders_apply_defaults() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
begin
  new.name := trim(regexp_replace(coalesce(new.name, ''), '\s+', ' ', 'g'));
  new.normalized_name := public.document_normalize_name(new.name);
  new.updated_at := now();

  if tg_op = 'INSERT' then
    new.created_at := coalesce(new.created_at, now());
    new.updated_at := coalesce(new.updated_at, new.created_at);
    new.created_by := coalesce(new.created_by, auth.uid());
    new.updated_by := coalesce(new.updated_by, auth.uid());
  else
    new.updated_by := coalesce(auth.uid(), new.updated_by);
  end if;

  return new;
end;
$$;


--
-- Name: document_normalize_name(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.document_normalize_name(input text) RETURNS text
    LANGUAGE sql IMMUTABLE
    SET search_path TO 'public'
    AS $$
  select lower(trim(regexp_replace(coalesce(input, ''), '\s+', ' ', 'g')));
$$;


--
-- Name: exec_sql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.exec_sql(sql_query text) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
  result json;
BEGIN
  EXECUTE sql_query;
  RETURN json_build_object('success', true, 'message', 'SQL executed successfully');
EXCEPTION
  WHEN OTHERS THEN
    RETURN json_build_object('success', false, 'error', SQLERRM);
END;
$$;


--
-- Name: get_piwigo_api_config(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_piwigo_api_config() RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
  setting_value jsonb;
begin
  if auth.uid() is null then
    return null;
  end if;

  if not public.can_manage_photos() then
    return null;
  end if;

  select value
    into setting_value
    from public.app_settings
   where key = 'piwigo-api-config'
   limit 1;

  return setting_value;
end;
$$;


--
-- Name: get_public_cells(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_public_cells() RETURNS TABLE(id uuid, name text, leader text, description text, color text, meeting_location text, meeting_day text, meeting_time text, region text, leader_photo_url text, contact_whatsapp text, slug text, display_order integer)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select
    c.id,
    c.name,
    c.leader,
    c.description,
    c.color,
    c.meeting_location,
    c.meeting_day,
    c.meeting_time,
    c.region,
    c.leader_photo_url,
    c.contact_whatsapp,
    c.slug,
    c.display_order
  from public.cells c
  where c.active = true and coalesce(c.is_public, false) = true
  order by c.display_order asc, c.name asc;
$$;


--
-- Name: get_public_events(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_public_events() RETURNS TABLE(id uuid, name text, summary text, description text, start_date timestamp with time zone, end_date timestamp with time zone, type text, status text, cover_image_url text, cta_label text, cta_url text, is_featured boolean, location_name text, location_map_url text, contact_whatsapp text, external_registration_url text, space_id uuid, space_name text, space_color text, is_recurring boolean, recurrence_frequency text, recurrence_interval integer, recurrence_byweekday integer[], recurrence_bymonthday integer, recurrence_bymonth integer, recurrence_end_date timestamp with time zone, excluded_dates text[])
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select
    e.id,
    e.name,
    e.summary,
    e.description,
    e.start_date,
    e.end_date,
    e.type::text,
    e.status::text,
    e.cover_image_url,
    e.cta_label,
    e.cta_url,
    coalesce(e.is_featured, false) as is_featured,
    coalesce(e.location_name, s.name) as location_name,
    e.location_map_url,
    e.contact_whatsapp,
    e.external_registration_url,
    e.space_id,
    s.name as space_name,
    s.color as space_color,
    e.is_recurring,
    e.recurrence_frequency::text,
    e.recurrence_interval,
    e.recurrence_byweekday,
    e.recurrence_bymonthday,
    e.recurrence_bymonth,
    e.recurrence_end_date,
    e.excluded_dates
  from public.events_eventos e
  left join public.spaces_eventos s on s.id = e.space_id
  where coalesce(e.is_public, true) = true
  order by e.start_date asc;
$$;


--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, username)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'full_name', 'Usuario'), COALESCE(NEW.raw_user_meta_data->>'username', NEW.email))
  ON CONFLICT (id) DO NOTHING;
  INSERT INTO public.ifc_user_roles (user_id, role)
  VALUES (NEW.id, COALESCE((NEW.raw_user_meta_data->>'role')::public.ifc_role, 'membro'))
  ON CONFLICT (user_id, role) DO NOTHING;
  RETURN NEW;
END;
$$;


--
-- Name: FUNCTION handle_new_user(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.handle_new_user() IS 'Trigger function to create profile and assign default role when a new user signs up';


--
-- Name: has_role(text, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.has_role(_role text, _user_id uuid) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role::text = _role
  );
END;
$$;


--
-- Name: has_role(uuid, public.app_role); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.has_role(_user_id uuid, _role public.app_role) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role = _role
  )
$$;


--
-- Name: FUNCTION has_role(_user_id uuid, _role public.app_role); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) IS 'Check if a user has a specific role. Uses SECURITY DEFINER to avoid RLS recursion.';


--
-- Name: ifc_has_role(uuid, public.ifc_role); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ifc_has_role(_user_id uuid, _role public.ifc_role) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT EXISTS (SELECT 1 FROM public.ifc_user_roles WHERE user_id = _user_id AND role = _role)
$$;


--
-- Name: is_admin(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_admin() RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.admin_users admins
    WHERE admins.user_id = auth.uid()
  );
$$;


--
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


--
-- Name: FUNCTION update_updated_at(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.update_updated_at() IS 'Trigger function to automatically update updated_at timestamp';


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public'
    AS $$
begin
  new.updated_at = now();
  return new;
end;
$$;


--
-- Name: update_visitantes_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_visitantes_updated_at() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  NEW.last_updated = now();
  RETURN NEW;
END;
$$;


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;

    sort_col := lower(sort_column);
    -- Validate sort column
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: -
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: -
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: -
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: -
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL,
    migrations_ran integer DEFAULT 0,
    broadcast_adapter character varying(255) DEFAULT 'gen_rpc'::character varying,
    max_presence_events_per_second integer DEFAULT 1000,
    max_payload_size_in_kb integer DEFAULT 3000
);


--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint
);


--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: access_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    login_at timestamp with time zone DEFAULT now() NOT NULL,
    user_agent text,
    ip_address text
);


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    bank_name text NOT NULL,
    account_number text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    user_id uuid
);


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcements (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    summary text,
    body text,
    image_url text,
    cta_label text,
    cta_url text,
    priority integer DEFAULT 0 NOT NULL,
    is_featured boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    published_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: annual_budgets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.annual_budgets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    category_id uuid,
    year integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    budgeted_amount numeric(15,2) DEFAULT 0 NOT NULL,
    actual_amount numeric(15,2) DEFAULT 0 NOT NULL
);


--
-- Name: app_contact_aliases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contact_aliases (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    contact_id uuid NOT NULL,
    instance_name text NOT NULL,
    alias_value text NOT NULL,
    alias_kind text NOT NULL,
    last_seen_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_contact_aliases_alias_kind_check CHECK ((alias_kind = ANY (ARRAY['phone'::text, 'jid'::text, 'lid'::text, 'participant'::text])))
);


--
-- Name: app_contact_aliases_backup_20260407; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contact_aliases_backup_20260407 (
    backup_run_at timestamp with time zone,
    id uuid,
    contact_id uuid,
    instance_name text,
    alias_value text,
    alias_kind text,
    last_seen_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: app_contact_threads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contact_threads (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    contact_id uuid,
    instance_name text NOT NULL,
    canonical_identifier text NOT NULL,
    display_name text NOT NULL,
    aliases text[] DEFAULT '{}'::text[] NOT NULL,
    first_outbound_at timestamp with time zone,
    first_inbound_reply_at timestamp with time zone,
    last_message_at timestamp with time zone,
    last_message_preview text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    last_synced_at timestamp with time zone,
    last_message_sync_at timestamp with time zone,
    message_backfill_completed_at timestamp with time zone,
    last_sync_error text
);


--
-- Name: app_contact_threads_backup_20260407; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contact_threads_backup_20260407 (
    backup_run_at timestamp with time zone,
    id uuid,
    contact_id uuid,
    instance_name text,
    canonical_identifier text,
    display_name text,
    aliases text[],
    first_outbound_at timestamp with time zone,
    first_inbound_reply_at timestamp with time zone,
    last_message_at timestamp with time zone,
    last_message_preview text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: app_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contacts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instance_name text NOT NULL,
    full_name text NOT NULL,
    phone_number text NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    normalized_phone text NOT NULL
);


--
-- Name: app_contacts_cleanup_backup_20260406; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contacts_cleanup_backup_20260406 (
    backup_id bigint NOT NULL,
    run_at timestamp with time zone NOT NULL,
    reason text NOT NULL,
    id uuid NOT NULL,
    instance_name text NOT NULL,
    full_name text NOT NULL,
    phone_number text NOT NULL,
    tags text[] NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    normalized_phone text NOT NULL,
    contact_snapshot jsonb NOT NULL,
    CONSTRAINT app_contacts_cleanup_backup_20260406_reason_check CHECK ((reason = ANY (ARRAY['quoted_printable_name'::text, 'duplicate_number'::text])))
);


--
-- Name: app_contacts_cleanup_backup_20260406_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_contacts_cleanup_backup_20260406_backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_contacts_cleanup_backup_20260406_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_contacts_cleanup_backup_20260406_backup_id_seq OWNED BY public.app_contacts_cleanup_backup_20260406.backup_id;


--
-- Name: app_contacts_phone_normalization_backup_20260407; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_contacts_phone_normalization_backup_20260407 (
    backup_id bigint NOT NULL,
    run_at timestamp with time zone NOT NULL,
    normalize_reason text NOT NULL,
    id uuid NOT NULL,
    instance_name text NOT NULL,
    full_name text NOT NULL,
    old_phone_number text NOT NULL,
    new_phone_number text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    row_snapshot jsonb NOT NULL
);


--
-- Name: app_contacts_phone_normalization_backup_20260407_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_contacts_phone_normalization_backup_20260407_backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_contacts_phone_normalization_backup_20260407_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_contacts_phone_normalization_backup_20260407_backup_id_seq OWNED BY public.app_contacts_phone_normalization_backup_20260407.backup_id;


--
-- Name: app_crm_runtime_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_crm_runtime_lock (
    lock_key text NOT NULL,
    lock_owner text,
    lock_until_utc timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_crm_visitor_activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_crm_visitor_activities (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    visitor_id uuid NOT NULL,
    activity_type text NOT NULL,
    note text,
    payload jsonb DEFAULT '{}'::jsonb NOT NULL,
    due_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_crm_visitor_activities_activity_type_check CHECK ((activity_type = ANY (ARRAY['auto_stage'::text, 'note'::text, 'follow_up'::text, 'manual_sync'::text])))
);


--
-- Name: app_crm_visitor_activities_backup_20260407; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_crm_visitor_activities_backup_20260407 (
    backup_run_at timestamp with time zone,
    id uuid,
    visitor_id uuid,
    activity_type text,
    note text,
    payload jsonb,
    due_at timestamp with time zone,
    created_at timestamp with time zone
);


--
-- Name: app_crm_visitors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_crm_visitors (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    contact_id uuid NOT NULL,
    thread_id uuid NOT NULL,
    instance_name text NOT NULL,
    match_source text NOT NULL,
    origin_label text NOT NULL,
    stage text NOT NULL,
    stage_entered_at timestamp with time zone DEFAULT now() NOT NULL,
    first_message_sent_at timestamp with time zone,
    first_reply_at timestamp with time zone,
    last_message_at timestamp with time zone,
    next_follow_up_at timestamp with time zone,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_crm_visitors_match_source_check CHECK ((match_source = ANY (ARRAY['tags'::text, 'name'::text, 'tags+name'::text]))),
    CONSTRAINT app_crm_visitors_origin_label_check CHECK ((origin_label = ANY (ARRAY['visitante'::text, 'visitante ifc'::text]))),
    CONSTRAINT app_crm_visitors_stage_check CHECK ((stage = ANY (ARRAY['new_visitor'::text, 'first_message_sent'::text, 'replied'::text, 'in_follow_up'::text, 'returned_visit'::text, 'consolidated'::text])))
);


--
-- Name: app_crm_visitors_backup_20260407; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_crm_visitors_backup_20260407 (
    backup_run_at timestamp with time zone,
    id uuid,
    contact_id uuid,
    thread_id uuid,
    instance_name text,
    match_source text,
    origin_label text,
    stage text,
    stage_entered_at timestamp with time zone,
    first_message_sent_at timestamp with time zone,
    first_reply_at timestamp with time zone,
    last_message_at timestamp with time zone,
    next_follow_up_at timestamp with time zone,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: app_custom_group_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_custom_group_members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    group_id uuid NOT NULL,
    phone_number text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_custom_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_custom_groups (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_dispatch_job_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_dispatch_job_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    job_id uuid NOT NULL,
    sequence integer NOT NULL,
    label text NOT NULL,
    target text NOT NULL,
    kind text NOT NULL,
    source text,
    status text NOT NULL,
    sent_at timestamp with time zone,
    error_message text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_dispatch_job_items_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'sending'::text, 'sent'::text, 'failed'::text, 'cancelled'::text, 'expired'::text])))
);


--
-- Name: app_dispatch_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_dispatch_jobs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instance_name text NOT NULL,
    flow_type text NOT NULL,
    send_mode text NOT NULL,
    recurrence_rule_id uuid,
    name text NOT NULL,
    timezone text DEFAULT 'America/Sao_Paulo'::text NOT NULL,
    scheduled_for_utc timestamp with time zone NOT NULL,
    misfire_deadline_utc timestamp with time zone NOT NULL,
    status text NOT NULL,
    throttle_ms integer DEFAULT 10000 NOT NULL,
    message_blocks jsonb DEFAULT '[]'::jsonb NOT NULL,
    targets_snapshot jsonb DEFAULT '[]'::jsonb NOT NULL,
    total_recipients integer DEFAULT 0 NOT NULL,
    sent_recipients integer DEFAULT 0 NOT NULL,
    failed_recipients integer DEFAULT 0 NOT NULL,
    cancelled_recipients integer DEFAULT 0 NOT NULL,
    expired_recipients integer DEFAULT 0 NOT NULL,
    error_message text,
    worker_id text,
    started_at timestamp with time zone,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_dispatch_jobs_flow_type_check CHECK ((flow_type = ANY (ARRAY['single'::text, 'contacts'::text, 'mass'::text, 'group_broadcast'::text]))),
    CONSTRAINT app_dispatch_jobs_send_mode_check CHECK ((send_mode = ANY (ARRAY['scheduled'::text, 'recurring'::text]))),
    CONSTRAINT app_dispatch_jobs_status_check CHECK ((status = ANY (ARRAY['queued'::text, 'running'::text, 'cancel_requested'::text, 'cancelled'::text, 'completed'::text, 'partial'::text, 'failed'::text, 'expired'::text])))
);


--
-- Name: app_dispatch_runtime_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_dispatch_runtime_lock (
    lock_key text NOT NULL,
    lock_owner text,
    lock_until_utc timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_document_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_document_files (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    folder_id uuid,
    name text NOT NULL,
    normalized_name text NOT NULL,
    storage_path text NOT NULL,
    mime_type text NOT NULL,
    extension text,
    size_bytes bigint,
    uploaded_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_document_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_document_folders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    normalized_name text NOT NULL,
    parent_folder_id uuid,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_group_send_collection_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_group_send_collection_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    collection_id uuid NOT NULL,
    group_id text NOT NULL,
    group_subject text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_group_send_collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_group_send_collections (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instance_name text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_instances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_instances (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    token text NOT NULL,
    phone_number text DEFAULT ''::text NOT NULL,
    status text DEFAULT 'created'::text NOT NULL,
    qrcode text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    management_mode text DEFAULT 'managed'::text NOT NULL,
    CONSTRAINT app_instances_management_mode_check CHECK ((management_mode = ANY (ARRAY['managed'::text, 'adopted'::text]))),
    CONSTRAINT app_instances_status_check CHECK ((status = ANY (ARRAY['created'::text, 'connecting'::text, 'open'::text, 'close'::text])))
);


--
-- Name: app_managed_instances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_managed_instances (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    name text NOT NULL,
    token text,
    phone_number text DEFAULT ''::text NOT NULL,
    status text DEFAULT 'created'::text NOT NULL,
    source text DEFAULT 'created'::text NOT NULL,
    qrcode text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT app_managed_instances_source_check CHECK ((source = ANY (ARRAY['created'::text, 'linked'::text]))),
    CONSTRAINT app_managed_instances_status_check CHECK ((status = ANY (ARRAY['created'::text, 'connecting'::text, 'open'::text, 'close'::text])))
);


--
-- Name: app_media_assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_media_assets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instance_name text NOT NULL,
    media_kind text NOT NULL,
    bucket text NOT NULL,
    path text NOT NULL,
    public_url text NOT NULL,
    mime_type text,
    size_bytes bigint,
    original_file_name text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_media_assets_media_kind_check CHECK ((media_kind = ANY (ARRAY['image'::text, 'audio'::text, 'video'::text, 'document'::text, 'sticker'::text, 'other'::text])))
);


--
-- Name: app_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_notifications (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    audience text DEFAULT 'all'::text,
    cta_label text,
    cta_url text,
    is_active boolean DEFAULT true NOT NULL,
    publish_at timestamp with time zone,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_official_group_favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_official_group_favorites (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instance_name text NOT NULL,
    group_id text NOT NULL,
    group_subject text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_photo_albums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_photo_albums (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    source_kind text DEFAULT 'manual'::text NOT NULL,
    source_id uuid,
    title text NOT NULL,
    event_name text NOT NULL,
    event_type text NOT NULL,
    event_date date NOT NULL,
    description text,
    piwigo_category_id integer,
    piwigo_parent_category_id integer,
    public_url text,
    cover_piwigo_image_id integer,
    publication_status text DEFAULT 'draft'::text NOT NULL,
    imported_from_piwigo boolean DEFAULT false NOT NULL,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_synced_at timestamp with time zone,
    sync_source text DEFAULT 'panel'::text NOT NULL,
    piwigo_status text,
    piwigo_name text,
    piwigo_comment text,
    CONSTRAINT app_photo_albums_publication_status_check CHECK ((publication_status = ANY (ARRAY['draft'::text, 'published'::text]))),
    CONSTRAINT app_photo_albums_source_kind_check CHECK ((source_kind = ANY (ARRAY['culto'::text, 'manual'::text])))
);


--
-- Name: app_photo_assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_photo_assets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    album_id uuid NOT NULL,
    piwigo_image_id integer NOT NULL,
    original_filename text NOT NULL,
    title text,
    sort_order integer DEFAULT 0 NOT NULL,
    mime_type text,
    thumbnail_url text,
    public_url text,
    uploaded_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_recurrence_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_recurrence_rules (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instance_name text NOT NULL,
    flow_type text NOT NULL,
    name text NOT NULL,
    timezone text DEFAULT 'America/Sao_Paulo'::text NOT NULL,
    recurrence_type text NOT NULL,
    weekly_days integer[] DEFAULT '{}'::integer[] NOT NULL,
    monthly_day integer,
    end_mode text NOT NULL,
    end_date date,
    max_occurrences integer,
    occurrences_generated integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    next_run_at_utc timestamp with time zone NOT NULL,
    message_blocks jsonb DEFAULT '[]'::jsonb NOT NULL,
    targets_snapshot jsonb DEFAULT '[]'::jsonb NOT NULL,
    throttle_ms integer DEFAULT 10000 NOT NULL,
    misfire_tolerance_hours integer DEFAULT 6 NOT NULL,
    last_generated_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    CONSTRAINT app_recurrence_rules_end_mode_check CHECK ((end_mode = ANY (ARRAY['never'::text, 'until_date'::text, 'after_occurrences'::text]))),
    CONSTRAINT app_recurrence_rules_flow_type_check CHECK ((flow_type = ANY (ARRAY['single'::text, 'contacts'::text, 'mass'::text, 'group_broadcast'::text]))),
    CONSTRAINT app_recurrence_rules_recurrence_type_check CHECK ((recurrence_type = ANY (ARRAY['daily'::text, 'weekly'::text, 'monthly'::text])))
);


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_settings (
    key text NOT NULL,
    value jsonb NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_thread_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_thread_messages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    thread_id uuid NOT NULL,
    evolution_message_id text NOT NULL,
    remote_jid text NOT NULL,
    remote_jid_alt text,
    participant text,
    participant_alt text,
    from_me boolean DEFAULT false NOT NULL,
    message_type text NOT NULL,
    preview text DEFAULT ''::text NOT NULL,
    message_timestamp timestamp with time zone,
    raw_payload jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL
);


--
-- Name: app_thread_messages_backup_20260407; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_thread_messages_backup_20260407 (
    backup_run_at timestamp with time zone,
    id uuid,
    thread_id uuid,
    evolution_message_id text,
    remote_jid text,
    remote_jid_alt text,
    participant text,
    participant_alt text,
    from_me boolean,
    message_type text,
    preview text,
    message_timestamp timestamp with time zone,
    raw_payload jsonb,
    created_at timestamp with time zone
);


--
-- Name: app_worker_health; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_worker_health (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    owner_user_id uuid DEFAULT public.app_primary_owner_uid() NOT NULL,
    worker_key text NOT NULL,
    worker_label text NOT NULL,
    last_status text DEFAULT 'idle'::text NOT NULL,
    last_heartbeat_at timestamp with time zone,
    last_started_at timestamp with time zone,
    last_finished_at timestamp with time zone,
    last_success_at timestamp with time zone,
    last_error text,
    last_summary jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT app_worker_health_last_status_check CHECK ((last_status = ANY (ARRAY['idle'::text, 'running'::text, 'ok'::text, 'error'::text, 'stale'::text])))
);


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    action text NOT NULL,
    table_name text,
    record_id uuid,
    old_data jsonb,
    new_data jsonb,
    created_at timestamp with time zone DEFAULT now(),
    details jsonb,
    resource text,
    resource_id text,
    user_email text DEFAULT 'sistema'::text,
    ip_address text,
    user_agent text
);


--
-- Name: bible_highlights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bible_highlights (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    book_abbrev text NOT NULL,
    book_name text NOT NULL,
    chapter integer NOT NULL,
    verse_number integer NOT NULL,
    verse_text text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: budgets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budgets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    category_id uuid,
    month integer NOT NULL,
    year integer NOT NULL,
    amount numeric(15,2) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT budgets_month_check CHECK (((month >= 1) AND (month <= 12)))
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    keywords text[],
    icon text,
    color text,
    code text DEFAULT '000'::text NOT NULL,
    parent_id uuid,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    type text,
    "order" integer,
    user_id uuid,
    CONSTRAINT categories_code_format CHECK ((code ~ '^\d{3}$'::text)),
    CONSTRAINT categories_type_check CHECK ((type = ANY (ARRAY['RECEITA'::text, 'DESPESA'::text, 'NEUTRA'::text])))
);


--
-- Name: cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cells (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    leader text,
    description text,
    color text DEFAULT '#9b87f5'::text,
    meeting_location text,
    meeting_day text,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    region text,
    leader_photo_url text,
    contact_whatsapp text,
    meeting_time text,
    slug text,
    is_public boolean DEFAULT true,
    display_order integer DEFAULT 0
);


--
-- Name: church_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.church_schedules (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text,
    day_of_week integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone,
    location_name text,
    category text DEFAULT 'culto'::text,
    display_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: church_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.church_settings (
    id text DEFAULT 'main'::text NOT NULL,
    church_name text DEFAULT 'Igreja da Familia Crista'::text NOT NULL,
    slogan text DEFAULT 'Uma Familia para Pertencer!'::text,
    description text,
    hero_title text,
    hero_subtitle text,
    welcome_text text,
    vision_text text,
    address_line text,
    address_city text,
    address_state text,
    postal_code text,
    map_embed_url text,
    map_link_url text,
    phone text,
    whatsapp text,
    email text,
    office_hours text,
    instagram_url text,
    youtube_url text,
    facebook_url text,
    logo_url text,
    cover_image_url text,
    app_name text DEFAULT 'Igreja Familia Crista'::text,
    app_primary_cta_label text,
    app_primary_cta_url text,
    app_secondary_cta_label text,
    app_secondary_cta_url text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: contact_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact_info (
    member_id uuid NOT NULL,
    mobile_phone text,
    landline_phone text,
    email text,
    street text DEFAULT ''::text,
    number text DEFAULT ''::text,
    complement text,
    neighborhood text DEFAULT ''::text,
    city text DEFAULT ''::text,
    state text DEFAULT ''::text,
    zip_code text DEFAULT ''::text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    duration text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: curricula; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curricula (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: devotional_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devotional_blocks (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    day_id uuid NOT NULL,
    block_type text NOT NULL,
    content jsonb NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: devotional_days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devotional_days (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    series_id uuid NOT NULL,
    day_number integer NOT NULL,
    title text NOT NULL,
    description text,
    is_published boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: devotional_journal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devotional_journal (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    day_id uuid NOT NULL,
    block_id uuid,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: devotional_media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devotional_media (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    block_id uuid,
    media_type text NOT NULL,
    url text NOT NULL,
    alt_text text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: devotional_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devotional_progress (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    day_id uuid NOT NULL,
    last_block_id uuid,
    completed_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: devotional_series; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devotional_series (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    description text,
    image_url text,
    is_published boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    tags text[] DEFAULT '{}'::text[] NOT NULL
);


--
-- Name: discipleship_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discipleship_members (
    discipleship_id uuid NOT NULL,
    member_id uuid NOT NULL,
    joined_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: discipleships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discipleships (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    discipler text,
    meeting_location text,
    meeting_day text,
    generation_level text,
    curriculum_id uuid,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: event_costs_eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_costs_eventos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    event_id uuid NOT NULL,
    description text NOT NULL,
    category text NOT NULL,
    amount numeric DEFAULT 0 NOT NULL,
    paid boolean DEFAULT false NOT NULL,
    due_date date,
    notes text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: TABLE event_costs_eventos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.event_costs_eventos IS 'Detailed costs and expenses for events';


--
-- Name: events_eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    name text NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone,
    is_all_day boolean,
    space_id uuid,
    type text DEFAULT 'interno'::text NOT NULL,
    description text,
    registration_goal integer,
    cost numeric,
    status text DEFAULT 'planejado'::text NOT NULL,
    is_special_event boolean,
    registration_amount numeric,
    allow_group_registration boolean,
    is_recurring boolean,
    recurrence_frequency text,
    recurrence_interval integer,
    recurrence_byweekday integer[],
    recurrence_bymonthday integer,
    recurrence_bymonth integer,
    recurrence_end_date timestamp with time zone,
    original_event_id uuid,
    has_financial_expenses boolean,
    is_routine boolean,
    created_at timestamp with time zone DEFAULT now(),
    excluded_dates date[] DEFAULT '{}'::date[],
    color text,
    summary text,
    cover_image_url text,
    cta_label text,
    cta_url text,
    is_public boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    location_name text,
    location_map_url text,
    contact_whatsapp text,
    external_registration_url text
);


--
-- Name: TABLE events_eventos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.events_eventos IS 'Church events with support for recurrence patterns';


--
-- Name: COLUMN events_eventos.cost; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events_eventos.cost IS 'Custo estimado total do evento. Pode ser NULL se não houver custo definido.';


--
-- Name: COLUMN events_eventos.is_special_event; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events_eventos.is_special_event IS 'Indica se é evento especial com inscrições. Pode ser NULL.';


--
-- Name: COLUMN events_eventos.excluded_dates; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events_eventos.excluded_dates IS 'Datas de ocorrências excluídas (ex.: cancelamento ou edição apenas desta). Formato: array de DATE.';


--
-- Name: COLUMN events_eventos.color; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events_eventos.color IS 'Cor do evento no calendário (classe Tailwind). Se NULL, usa a cor do espaço.';


--
-- Name: family_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.family_info (
    member_id uuid NOT NULL,
    spouse_name text,
    spouse_is_member boolean DEFAULT false,
    marriage_date date,
    number_of_children integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: gifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gifts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: giving_methods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.giving_methods (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    method_type text NOT NULL,
    description text,
    pix_key text,
    bank_name text,
    agency text,
    account_number text,
    qr_code_url text,
    cta_label text,
    cta_url text,
    display_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: habit_completions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habit_completions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    habit_id uuid NOT NULL,
    date date NOT NULL
);


--
-- Name: TABLE habit_completions; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.habit_completions IS 'Conclusões diárias dos hábitos';


--
-- Name: habits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habits (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    color text NOT NULL,
    icon text NOT NULL,
    frequency text NOT NULL,
    custom_days integer[],
    reminder text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    CONSTRAINT habits_frequency_check CHECK ((frequency = ANY (ARRAY['daily'::text, 'weekdays'::text, 'weekends'::text, 'custom'::text])))
);


--
-- Name: TABLE habits; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.habits IS 'Hábitos do HabitFlow';


--
-- Name: COLUMN habits.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.habits.user_id IS 'Usuário dono do hábito (Supabase Auth)';


--
-- Name: home_banners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.home_banners (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    subtitle text,
    badge text,
    image_url text,
    mobile_image_url text,
    cta_label text,
    cta_url text,
    display_order integer DEFAULT 0 NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: ifc_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ifc_user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    role public.ifc_role NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: ilustracaoes_de_sermoes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ilustracaoes_de_sermoes (
    uuid text NOT NULL,
    story_id bigint,
    slug text,
    url text,
    content_type text,
    source_component text,
    title text,
    author text,
    summary text,
    body_text text,
    citations text,
    canonical_ref text,
    categories text,
    top_level_categories text,
    bible_references text,
    keywords text,
    auto_tags text,
    lang text,
    published_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_at timestamp with time zone,
    ai_text text,
    imported_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: initial_balances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.initial_balances (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    account_id uuid,
    balance_date date,
    balance numeric(15,2) DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    account_type text,
    year integer,
    amount numeric DEFAULT 0
);


--
-- Name: institutional_pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.institutional_pages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    slug text NOT NULL,
    title text NOT NULL,
    excerpt text,
    hero_title text,
    hero_subtitle text,
    content text DEFAULT ''::text NOT NULL,
    cover_image_url text,
    seo_description text,
    display_order integer DEFAULT 0 NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: media_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    series_id uuid,
    title text NOT NULL,
    slug text NOT NULL,
    description text,
    speaker_name text,
    category text,
    youtube_url text,
    embed_url text,
    thumbnail_url text,
    duration_label text,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    published_at timestamp with time zone DEFAULT now() NOT NULL,
    is_featured boolean DEFAULT false NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: media_series; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media_series (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    description text,
    cover_image_url text,
    speaker_name text,
    category text,
    display_order integer DEFAULT 0 NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: member_availability; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_availability (
    member_id uuid NOT NULL,
    day_of_week text NOT NULL,
    period text NOT NULL,
    available boolean DEFAULT false
);


--
-- Name: member_cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_cells (
    member_id uuid NOT NULL,
    cell_id uuid NOT NULL,
    joined_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: member_courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_courses (
    member_id uuid NOT NULL,
    course_id uuid NOT NULL,
    completed_date date,
    certificate text
);


--
-- Name: member_gifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_gifts (
    member_id uuid NOT NULL,
    gift_id uuid NOT NULL
);


--
-- Name: member_ministries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_ministries (
    member_id uuid NOT NULL,
    ministry_id uuid NOT NULL,
    role text,
    joined_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: member_talents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_talents (
    member_id uuid NOT NULL,
    talent_id uuid NOT NULL
);


--
-- Name: members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    full_name text NOT NULL,
    birth_date date,
    gender text,
    marital_status text,
    cpf text,
    rg text,
    nationality text,
    birth_city text,
    birth_state text,
    status text DEFAULT 'ativo'::text,
    photo_url text,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: ministerial_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ministerial_info (
    member_id uuid NOT NULL,
    involvement_level text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: ministries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ministries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    color text,
    leader text,
    target_audience text[] DEFAULT '{}'::text[],
    instagram text,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: offerers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offerers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text,
    phone text,
    address text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: other_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.other_info (
    member_id uuid NOT NULL,
    profession text,
    company text,
    education_level text,
    special_skills text,
    special_needs text,
    health_conditions text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: prayer_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prayer_requests (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    request_text text NOT NULL,
    request_date date DEFAULT CURRENT_DATE NOT NULL,
    is_answered boolean DEFAULT false NOT NULL,
    answered_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: presentations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.presentations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    pdf_url text NOT NULL,
    file_name text,
    event_date date,
    location text,
    extra_info text,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    pregador text,
    file_size bigint
);


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    full_name text,
    avatar_url text,
    phone text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    username text
);


--
-- Name: TABLE profiles; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.profiles IS 'User profiles linked to Supabase auth.users';


--
-- Name: public_prayers; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.public_prayers AS
 SELECT prayer_requests.id,
    prayer_requests.user_id,
    prayer_requests.request_text,
    prayer_requests.request_date,
    prayer_requests.is_answered,
    prayer_requests.answered_at,
    prayer_requests.created_at,
    prayer_requests.updated_at
   FROM public.prayer_requests;


--
-- Name: receipts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.receipts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    tither_id uuid,
    offerer_id uuid,
    valor numeric(15,2),
    data_recibo date,
    observacoes text,
    numero_recibo text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    cpf_recebedor text,
    nome_recebedor text,
    motivo text,
    user_id uuid
);


--
-- Name: registrations_eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registrations_eventos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    event_id uuid NOT NULL,
    name text NOT NULL,
    whatsapp text NOT NULL,
    amount numeric NOT NULL,
    payment_method text DEFAULT 'pix'::text NOT NULL,
    paid boolean DEFAULT false,
    group_id uuid,
    group_role text,
    group_name text,
    gender text,
    age_group text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: TABLE registrations_eventos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.registrations_eventos IS 'Event registrations with support for group registrations';


--
-- Name: COLUMN registrations_eventos.paid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.registrations_eventos.paid IS 'Status de pagamento da inscrição. Pode ser NULL (não pago).';


--
-- Name: registros_cultos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registros_cultos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    data_culto date NOT NULL,
    pregador text NOT NULL,
    abertura_culto text,
    ministerio_louvor text NOT NULL,
    tema_sermao text NOT NULL,
    musicas_tocadas jsonb DEFAULT '[]'::jsonb NOT NULL,
    tags jsonb DEFAULT '[]'::jsonb,
    referencias_biblicas jsonb DEFAULT '[]'::jsonb,
    numero_participantes integer DEFAULT 0 NOT NULL,
    numero_visitantes integer DEFAULT 0 NOT NULL,
    link_youtube text,
    link_spotify text,
    link_fotos text,
    link_slides text,
    esboco_sermao_url text,
    observacoes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_cell_highlights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_cell_highlights (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text,
    icon_key text DEFAULT 'users'::text NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_cell_page_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_cell_page_settings (
    id text DEFAULT 'main'::text NOT NULL,
    hero_title text,
    hero_subtitle text,
    hero_image_url text,
    intro_title text,
    intro_kicker text,
    intro_body text,
    supporting_body text,
    highlight_statement text,
    cta_body text,
    primary_cta_label text,
    primary_cta_url text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_giving_page_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_giving_page_settings (
    id text DEFAULT 'main'::text NOT NULL,
    hero_badge text,
    hero_title text,
    hero_description text,
    closing_message text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_home_banners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_home_banners (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    subtitle text,
    badge text,
    image_url text,
    cta_label text,
    cta_url text,
    display_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_media_highlights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_media_highlights (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    summary text,
    badge text,
    youtube_url text,
    thumbnail_url text,
    cta_label text,
    cta_url text,
    display_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_pages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    slug text NOT NULL,
    title text NOT NULL,
    excerpt text,
    hero_title text,
    hero_subtitle text,
    content text DEFAULT ''::text NOT NULL,
    cover_image_url text,
    seo_description text,
    display_order integer DEFAULT 0 NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: site_ifc_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_settings (
    id text DEFAULT 'main'::text NOT NULL,
    site_name text DEFAULT 'Igreja da Família Cristã'::text NOT NULL,
    slogan text,
    description text,
    hero_title text,
    hero_subtitle text,
    hero_description text,
    welcome_title text,
    welcome_body text,
    vision_title text,
    vision_body text,
    address_line text,
    address_city text,
    address_state text,
    map_embed_url text,
    map_link_url text,
    phone text,
    whatsapp text,
    email text,
    instagram_url text,
    youtube_url text,
    facebook_url text,
    logo_url text,
    cover_image_url text,
    footer_text text,
    primary_cta_label text,
    primary_cta_url text,
    secondary_cta_label text,
    secondary_cta_url text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    office_hours text,
    program_section_title text,
    program_section_description text,
    gallery_section_title text,
    gallery_section_description text,
    location_section_title text,
    location_section_description text,
    contact_section_title text,
    contact_section_description text,
    about_section_description text
);


--
-- Name: site_ifc_studies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_ifc_studies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    slug text NOT NULL,
    title text NOT NULL,
    excerpt text,
    content text DEFAULT ''::text NOT NULL,
    cover_image_url text,
    seo_description text,
    author_name text,
    category text,
    reading_time_label text,
    is_featured boolean DEFAULT false NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    published_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: spaces_eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spaces_eventos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    name text NOT NULL,
    capacity integer NOT NULL,
    color text NOT NULL,
    status text DEFAULT 'available'::text NOT NULL,
    responsible text,
    description text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: TABLE spaces_eventos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.spaces_eventos IS 'Physical spaces/locations available for events';


--
-- Name: COLUMN spaces_eventos.responsible; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.spaces_eventos.responsible IS 'Nome do responsável pelo espaço. Pode ser NULL.';


--
-- Name: spiritual_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spiritual_info (
    member_id uuid NOT NULL,
    conversion_date date,
    baptism_date date,
    baptism_location text,
    conversion_church text,
    member_since date,
    previous_church text,
    spiritual_status text,
    discipler text,
    attendance_frequency text,
    participates_cell boolean DEFAULT false,
    participates_discipleship boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: talents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talents (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: tithers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tithers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text,
    phone text,
    address text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transactions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    account_id uuid,
    transaction_date date NOT NULL,
    description text NOT NULL,
    amount numeric(15,2) NOT NULL,
    transaction_type text NOT NULL,
    balance numeric(15,2),
    fitid text,
    category text DEFAULT 'Sem categoria'::text,
    notes text,
    created_at timestamp with time zone DEFAULT now(),
    entry_type text,
    method text,
    user_id uuid,
    CONSTRAINT transactions_entry_type_check CHECK (((entry_type = ANY (ARRAY['RECEITA'::text, 'DESPESA'::text])) OR (entry_type IS NULL))),
    CONSTRAINT transactions_transaction_type_check CHECK ((transaction_type = ANY (ARRAY['CREDIT'::text, 'DEBIT'::text])))
);


--
-- Name: user_notes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_notes (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    note_date date DEFAULT CURRENT_DATE NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    role public.app_role DEFAULT 'user'::public.app_role NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: TABLE user_roles; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.user_roles IS 'User roles assignment table';


--
-- Name: users_with_roles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.users_with_roles AS
 SELECT u.id,
    u.email,
    u.created_at,
    u.email_confirmed_at,
    COALESCE((ur.role)::text, 'user'::text) AS role
   FROM (auth.users u
     LEFT JOIN public.user_roles ur ON ((u.id = ur.user_id)));


--
-- Name: visitantes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visitantes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    data_submissao timestamp with time zone DEFAULT now() NOT NULL,
    data date NOT NULL,
    visitando text NOT NULL,
    telefone text,
    nome text NOT NULL,
    sobrenome text,
    idade integer,
    estado_civil public.estado_civil_enum,
    filhos text,
    cidade text,
    frequenta_igreja public.frequenta_igreja_enum,
    qual text,
    pedido text,
    origem text DEFAULT 'manual'::text,
    last_updated timestamp with time zone DEFAULT now(),
    external_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    msg_enviada boolean DEFAULT false,
    respondeu_msg boolean DEFAULT false,
    observacoes text,
    CONSTRAINT visitantes_idade_check CHECK ((idade >= 0))
);

ALTER TABLE ONLY public.visitantes REPLICA IDENTITY FULL;


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


--
-- Name: messages_2026_04_18; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_04_18 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2026_04_20; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_04_20 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2026_04_21; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_04_21 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2026_04_22; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_04_22 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2026_04_23; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_04_23 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2026_04_24; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_04_24 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: iceberg_namespaces; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.iceberg_namespaces (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: iceberg_tables; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.iceberg_tables (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    namespace_id uuid NOT NULL,
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    location text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: -
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: -
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: -
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: -
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: -
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: messages_2026_04_18; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_18 FOR VALUES FROM ('2026-04-18 00:00:00') TO ('2026-04-19 00:00:00');


--
-- Name: messages_2026_04_20; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_20 FOR VALUES FROM ('2026-04-20 00:00:00') TO ('2026-04-21 00:00:00');


--
-- Name: messages_2026_04_21; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_21 FOR VALUES FROM ('2026-04-21 00:00:00') TO ('2026-04-22 00:00:00');


--
-- Name: messages_2026_04_22; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_22 FOR VALUES FROM ('2026-04-22 00:00:00') TO ('2026-04-23 00:00:00');


--
-- Name: messages_2026_04_23; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_23 FOR VALUES FROM ('2026-04-23 00:00:00') TO ('2026-04-24 00:00:00');


--
-- Name: messages_2026_04_24; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_24 FOR VALUES FROM ('2026-04-24 00:00:00') TO ('2026-04-25 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: app_contacts_cleanup_backup_20260406 backup_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contacts_cleanup_backup_20260406 ALTER COLUMN backup_id SET DEFAULT nextval('public.app_contacts_cleanup_backup_20260406_backup_id_seq'::regclass);


--
-- Name: app_contacts_phone_normalization_backup_20260407 backup_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contacts_phone_normalization_backup_20260407 ALTER COLUMN backup_id SET DEFAULT nextval('public.app_contacts_phone_normalization_backup_20260407_backup_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: access_logs access_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (user_id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: annual_budgets annual_budgets_category_id_year_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annual_budgets
    ADD CONSTRAINT annual_budgets_category_id_year_key UNIQUE (category_id, year);


--
-- Name: annual_budgets annual_budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annual_budgets
    ADD CONSTRAINT annual_budgets_pkey PRIMARY KEY (id);


--
-- Name: app_contact_aliases app_contact_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contact_aliases
    ADD CONSTRAINT app_contact_aliases_pkey PRIMARY KEY (id);


--
-- Name: app_contact_threads app_contact_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contact_threads
    ADD CONSTRAINT app_contact_threads_pkey PRIMARY KEY (id);


--
-- Name: app_contacts_cleanup_backup_20260406 app_contacts_cleanup_backup_20260406_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contacts_cleanup_backup_20260406
    ADD CONSTRAINT app_contacts_cleanup_backup_20260406_pkey PRIMARY KEY (backup_id);


--
-- Name: app_contacts_phone_normalization_backup_20260407 app_contacts_phone_normalization_backup_20260407_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contacts_phone_normalization_backup_20260407
    ADD CONSTRAINT app_contacts_phone_normalization_backup_20260407_pkey PRIMARY KEY (backup_id);


--
-- Name: app_contacts app_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contacts
    ADD CONSTRAINT app_contacts_pkey PRIMARY KEY (id);


--
-- Name: app_crm_runtime_lock app_crm_runtime_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_runtime_lock
    ADD CONSTRAINT app_crm_runtime_lock_pkey PRIMARY KEY (lock_key);


--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_visitor_activities
    ADD CONSTRAINT app_crm_visitor_activities_pkey PRIMARY KEY (id);


--
-- Name: app_crm_visitors app_crm_visitors_instance_name_contact_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_visitors
    ADD CONSTRAINT app_crm_visitors_instance_name_contact_id_key UNIQUE (instance_name, contact_id);


--
-- Name: app_crm_visitors app_crm_visitors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_visitors
    ADD CONSTRAINT app_crm_visitors_pkey PRIMARY KEY (id);


--
-- Name: app_custom_group_members app_custom_group_members_group_id_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_custom_group_members
    ADD CONSTRAINT app_custom_group_members_group_id_phone_number_key UNIQUE (group_id, phone_number);


--
-- Name: app_custom_group_members app_custom_group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_custom_group_members
    ADD CONSTRAINT app_custom_group_members_pkey PRIMARY KEY (id);


--
-- Name: app_custom_groups app_custom_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_custom_groups
    ADD CONSTRAINT app_custom_groups_pkey PRIMARY KEY (id);


--
-- Name: app_dispatch_job_items app_dispatch_job_items_job_id_sequence_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_dispatch_job_items
    ADD CONSTRAINT app_dispatch_job_items_job_id_sequence_key UNIQUE (job_id, sequence);


--
-- Name: app_dispatch_job_items app_dispatch_job_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_dispatch_job_items
    ADD CONSTRAINT app_dispatch_job_items_pkey PRIMARY KEY (id);


--
-- Name: app_dispatch_jobs app_dispatch_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_dispatch_jobs
    ADD CONSTRAINT app_dispatch_jobs_pkey PRIMARY KEY (id);


--
-- Name: app_dispatch_runtime_lock app_dispatch_runtime_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_dispatch_runtime_lock
    ADD CONSTRAINT app_dispatch_runtime_lock_pkey PRIMARY KEY (lock_key);


--
-- Name: app_document_files app_document_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_document_files
    ADD CONSTRAINT app_document_files_pkey PRIMARY KEY (id);


--
-- Name: app_document_files app_document_files_storage_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_document_files
    ADD CONSTRAINT app_document_files_storage_path_key UNIQUE (storage_path);


--
-- Name: app_document_folders app_document_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_document_folders
    ADD CONSTRAINT app_document_folders_pkey PRIMARY KEY (id);


--
-- Name: app_group_send_collection_items app_group_send_collection_items_collection_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_group_send_collection_items
    ADD CONSTRAINT app_group_send_collection_items_collection_id_group_id_key UNIQUE (collection_id, group_id);


--
-- Name: app_group_send_collection_items app_group_send_collection_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_group_send_collection_items
    ADD CONSTRAINT app_group_send_collection_items_pkey PRIMARY KEY (id);


--
-- Name: app_group_send_collections app_group_send_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_group_send_collections
    ADD CONSTRAINT app_group_send_collections_pkey PRIMARY KEY (id);


--
-- Name: app_instances app_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_instances
    ADD CONSTRAINT app_instances_pkey PRIMARY KEY (id);


--
-- Name: app_managed_instances app_managed_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_managed_instances
    ADD CONSTRAINT app_managed_instances_pkey PRIMARY KEY (id);


--
-- Name: app_media_assets app_media_assets_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_media_assets
    ADD CONSTRAINT app_media_assets_path_key UNIQUE (path);


--
-- Name: app_media_assets app_media_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_media_assets
    ADD CONSTRAINT app_media_assets_pkey PRIMARY KEY (id);


--
-- Name: app_notifications app_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_notifications
    ADD CONSTRAINT app_notifications_pkey PRIMARY KEY (id);


--
-- Name: app_official_group_favorites app_official_group_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_official_group_favorites
    ADD CONSTRAINT app_official_group_favorites_pkey PRIMARY KEY (id);


--
-- Name: app_photo_albums app_photo_albums_piwigo_category_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_photo_albums
    ADD CONSTRAINT app_photo_albums_piwigo_category_id_key UNIQUE (piwigo_category_id);


--
-- Name: app_photo_albums app_photo_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_photo_albums
    ADD CONSTRAINT app_photo_albums_pkey PRIMARY KEY (id);


--
-- Name: app_photo_assets app_photo_assets_piwigo_image_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_photo_assets
    ADD CONSTRAINT app_photo_assets_piwigo_image_id_key UNIQUE (piwigo_image_id);


--
-- Name: app_photo_assets app_photo_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_photo_assets
    ADD CONSTRAINT app_photo_assets_pkey PRIMARY KEY (id);


--
-- Name: app_recurrence_rules app_recurrence_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_recurrence_rules
    ADD CONSTRAINT app_recurrence_rules_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (key);


--
-- Name: app_thread_messages app_thread_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_thread_messages
    ADD CONSTRAINT app_thread_messages_pkey PRIMARY KEY (id);


--
-- Name: app_thread_messages app_thread_messages_thread_id_evolution_message_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_thread_messages
    ADD CONSTRAINT app_thread_messages_thread_id_evolution_message_id_key UNIQUE (thread_id, evolution_message_id);


--
-- Name: app_worker_health app_worker_health_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_worker_health
    ADD CONSTRAINT app_worker_health_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: bible_highlights bible_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bible_highlights
    ADD CONSTRAINT bible_highlights_pkey PRIMARY KEY (id);


--
-- Name: bible_highlights bible_highlights_user_id_book_abbrev_chapter_verse_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bible_highlights
    ADD CONSTRAINT bible_highlights_user_id_book_abbrev_chapter_verse_number_key UNIQUE (user_id, book_abbrev, chapter, verse_number);


--
-- Name: budgets budgets_category_id_month_year_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_category_id_month_year_key UNIQUE (category_id, month, year);


--
-- Name: budgets budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_parent_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_parent_unique UNIQUE (name, parent_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cells cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cells
    ADD CONSTRAINT cells_pkey PRIMARY KEY (id);


--
-- Name: church_schedules church_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.church_schedules
    ADD CONSTRAINT church_schedules_pkey PRIMARY KEY (id);


--
-- Name: church_settings church_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.church_settings
    ADD CONSTRAINT church_settings_pkey PRIMARY KEY (id);


--
-- Name: contact_info contact_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_pkey PRIMARY KEY (member_id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: curricula curricula_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curricula
    ADD CONSTRAINT curricula_pkey PRIMARY KEY (id);


--
-- Name: devotional_blocks devotional_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_blocks
    ADD CONSTRAINT devotional_blocks_pkey PRIMARY KEY (id);


--
-- Name: devotional_days devotional_days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_days
    ADD CONSTRAINT devotional_days_pkey PRIMARY KEY (id);


--
-- Name: devotional_days devotional_days_series_id_day_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_days
    ADD CONSTRAINT devotional_days_series_id_day_number_key UNIQUE (series_id, day_number);


--
-- Name: devotional_journal devotional_journal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_journal
    ADD CONSTRAINT devotional_journal_pkey PRIMARY KEY (id);


--
-- Name: devotional_media devotional_media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_media
    ADD CONSTRAINT devotional_media_pkey PRIMARY KEY (id);


--
-- Name: devotional_progress devotional_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_progress
    ADD CONSTRAINT devotional_progress_pkey PRIMARY KEY (id);


--
-- Name: devotional_progress devotional_progress_user_id_day_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_progress
    ADD CONSTRAINT devotional_progress_user_id_day_id_key UNIQUE (user_id, day_id);


--
-- Name: devotional_series devotional_series_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_series
    ADD CONSTRAINT devotional_series_pkey PRIMARY KEY (id);


--
-- Name: discipleship_members discipleship_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discipleship_members
    ADD CONSTRAINT discipleship_members_pkey PRIMARY KEY (discipleship_id, member_id);


--
-- Name: discipleships discipleships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discipleships
    ADD CONSTRAINT discipleships_pkey PRIMARY KEY (id);


--
-- Name: event_costs_eventos event_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_costs_eventos
    ADD CONSTRAINT event_costs_pkey PRIMARY KEY (id);


--
-- Name: events_eventos events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventos
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: family_info family_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.family_info
    ADD CONSTRAINT family_info_pkey PRIMARY KEY (member_id);


--
-- Name: gifts gifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gifts
    ADD CONSTRAINT gifts_pkey PRIMARY KEY (id);


--
-- Name: giving_methods giving_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.giving_methods
    ADD CONSTRAINT giving_methods_pkey PRIMARY KEY (id);


--
-- Name: habit_completions habit_completions_habit_id_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit_completions
    ADD CONSTRAINT habit_completions_habit_id_date_key UNIQUE (habit_id, date);


--
-- Name: habit_completions habit_completions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit_completions
    ADD CONSTRAINT habit_completions_pkey PRIMARY KEY (id);


--
-- Name: habits habits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habits
    ADD CONSTRAINT habits_pkey PRIMARY KEY (id);


--
-- Name: home_banners home_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_banners
    ADD CONSTRAINT home_banners_pkey PRIMARY KEY (id);


--
-- Name: ifc_user_roles ifc_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ifc_user_roles
    ADD CONSTRAINT ifc_user_roles_pkey PRIMARY KEY (id);


--
-- Name: ifc_user_roles ifc_user_roles_user_id_role_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ifc_user_roles
    ADD CONSTRAINT ifc_user_roles_user_id_role_key UNIQUE (user_id, role);


--
-- Name: ilustracaoes_de_sermoes ilustracaoes_de_sermoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ilustracaoes_de_sermoes
    ADD CONSTRAINT ilustracaoes_de_sermoes_pkey PRIMARY KEY (uuid);


--
-- Name: initial_balances initial_balances_account_id_balance_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.initial_balances
    ADD CONSTRAINT initial_balances_account_id_balance_date_key UNIQUE (account_id, balance_date);


--
-- Name: initial_balances initial_balances_account_type_year_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.initial_balances
    ADD CONSTRAINT initial_balances_account_type_year_unique UNIQUE (account_type, year);


--
-- Name: initial_balances initial_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.initial_balances
    ADD CONSTRAINT initial_balances_pkey PRIMARY KEY (id);


--
-- Name: institutional_pages institutional_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.institutional_pages
    ADD CONSTRAINT institutional_pages_pkey PRIMARY KEY (id);


--
-- Name: institutional_pages institutional_pages_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.institutional_pages
    ADD CONSTRAINT institutional_pages_slug_key UNIQUE (slug);


--
-- Name: media_items media_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_items
    ADD CONSTRAINT media_items_pkey PRIMARY KEY (id);


--
-- Name: media_items media_items_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_items
    ADD CONSTRAINT media_items_slug_key UNIQUE (slug);


--
-- Name: media_series media_series_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_series
    ADD CONSTRAINT media_series_pkey PRIMARY KEY (id);


--
-- Name: media_series media_series_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_series
    ADD CONSTRAINT media_series_slug_key UNIQUE (slug);


--
-- Name: member_availability member_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_availability
    ADD CONSTRAINT member_availability_pkey PRIMARY KEY (member_id, day_of_week, period);


--
-- Name: member_cells member_cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_cells
    ADD CONSTRAINT member_cells_pkey PRIMARY KEY (member_id, cell_id);


--
-- Name: member_courses member_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_courses
    ADD CONSTRAINT member_courses_pkey PRIMARY KEY (member_id, course_id);


--
-- Name: member_gifts member_gifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_gifts
    ADD CONSTRAINT member_gifts_pkey PRIMARY KEY (member_id, gift_id);


--
-- Name: member_ministries member_ministries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_ministries
    ADD CONSTRAINT member_ministries_pkey PRIMARY KEY (member_id, ministry_id);


--
-- Name: member_talents member_talents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_talents
    ADD CONSTRAINT member_talents_pkey PRIMARY KEY (member_id, talent_id);


--
-- Name: members members_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_cpf_key UNIQUE (cpf);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: ministerial_info ministerial_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ministerial_info
    ADD CONSTRAINT ministerial_info_pkey PRIMARY KEY (member_id);


--
-- Name: ministries ministries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ministries
    ADD CONSTRAINT ministries_pkey PRIMARY KEY (id);


--
-- Name: offerers offerers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offerers
    ADD CONSTRAINT offerers_pkey PRIMARY KEY (id);


--
-- Name: other_info other_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.other_info
    ADD CONSTRAINT other_info_pkey PRIMARY KEY (member_id);


--
-- Name: prayer_requests prayer_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prayer_requests
    ADD CONSTRAINT prayer_requests_pkey PRIMARY KEY (id);


--
-- Name: presentations presentations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.presentations
    ADD CONSTRAINT presentations_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);


--
-- Name: receipts receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: receipts receipts_receipt_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_receipt_number_key UNIQUE (numero_recibo);


--
-- Name: registrations_eventos registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registrations_eventos
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: registros_cultos registros_cultos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registros_cultos
    ADD CONSTRAINT registros_cultos_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_cell_highlights site_ifc_cell_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_cell_highlights
    ADD CONSTRAINT site_ifc_cell_highlights_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_cell_page_settings site_ifc_cell_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_cell_page_settings
    ADD CONSTRAINT site_ifc_cell_page_settings_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_giving_page_settings site_ifc_giving_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_giving_page_settings
    ADD CONSTRAINT site_ifc_giving_page_settings_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_home_banners site_ifc_home_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_home_banners
    ADD CONSTRAINT site_ifc_home_banners_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_media_highlights site_ifc_media_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_media_highlights
    ADD CONSTRAINT site_ifc_media_highlights_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_pages site_ifc_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_pages
    ADD CONSTRAINT site_ifc_pages_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_pages site_ifc_pages_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_pages
    ADD CONSTRAINT site_ifc_pages_slug_key UNIQUE (slug);


--
-- Name: site_ifc_settings site_ifc_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_settings
    ADD CONSTRAINT site_ifc_settings_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_studies site_ifc_studies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_studies
    ADD CONSTRAINT site_ifc_studies_pkey PRIMARY KEY (id);


--
-- Name: site_ifc_studies site_ifc_studies_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_ifc_studies
    ADD CONSTRAINT site_ifc_studies_slug_key UNIQUE (slug);


--
-- Name: spaces_eventos spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spaces_eventos
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (id);


--
-- Name: spiritual_info spiritual_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spiritual_info
    ADD CONSTRAINT spiritual_info_pkey PRIMARY KEY (member_id);


--
-- Name: talents talents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talents
    ADD CONSTRAINT talents_pkey PRIMARY KEY (id);


--
-- Name: tithers tithers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tithers
    ADD CONSTRAINT tithers_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_fitid_account_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_fitid_account_id_key UNIQUE (fitid, account_id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: user_notes user_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_notes
    ADD CONSTRAINT user_notes_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_user_id_role_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_role_key UNIQUE (user_id, role);


--
-- Name: visitantes visitantes_external_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitantes
    ADD CONSTRAINT visitantes_external_id_key UNIQUE (external_id);


--
-- Name: visitantes visitantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitantes
    ADD CONSTRAINT visitantes_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_18 messages_2026_04_18_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_18
    ADD CONSTRAINT messages_2026_04_18_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_20 messages_2026_04_20_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_20
    ADD CONSTRAINT messages_2026_04_20_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_21 messages_2026_04_21_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_21
    ADD CONSTRAINT messages_2026_04_21_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_22 messages_2026_04_22_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_22
    ADD CONSTRAINT messages_2026_04_22_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_23 messages_2026_04_23_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_23
    ADD CONSTRAINT messages_2026_04_23_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_24 messages_2026_04_24_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_24
    ADD CONSTRAINT messages_2026_04_24_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: iceberg_namespaces iceberg_namespaces_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_pkey PRIMARY KEY (id);


--
-- Name: iceberg_tables iceberg_tables_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: -
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: -
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: -
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: app_contact_aliases_contact_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_contact_aliases_contact_idx ON public.app_contact_aliases USING btree (contact_id, instance_name);


--
-- Name: app_contact_aliases_owner_instance_alias_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_contact_aliases_owner_instance_alias_idx ON public.app_contact_aliases USING btree (owner_user_id, instance_name, alias_value);


--
-- Name: app_contact_threads_instance_last_message_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_contact_threads_instance_last_message_idx ON public.app_contact_threads USING btree (instance_name, last_message_at DESC NULLS LAST);


--
-- Name: app_contact_threads_owner_instance_canonical_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_contact_threads_owner_instance_canonical_idx ON public.app_contact_threads USING btree (owner_user_id, instance_name, canonical_identifier);


--
-- Name: app_contact_threads_owner_instance_contact_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_contact_threads_owner_instance_contact_idx ON public.app_contact_threads USING btree (owner_user_id, instance_name, contact_id);


--
-- Name: app_contact_threads_owner_instance_sync_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_contact_threads_owner_instance_sync_idx ON public.app_contact_threads USING btree (owner_user_id, instance_name, last_synced_at DESC NULLS LAST);


--
-- Name: app_contacts_owner_instance_created_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_contacts_owner_instance_created_idx ON public.app_contacts USING btree (owner_user_id, instance_name, created_at DESC);


--
-- Name: app_contacts_owner_instance_normalized_phone_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_contacts_owner_instance_normalized_phone_idx ON public.app_contacts USING btree (owner_user_id, instance_name, normalized_phone);


--
-- Name: app_crm_visitor_activities_visitor_created_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_crm_visitor_activities_visitor_created_idx ON public.app_crm_visitor_activities USING btree (visitor_id, created_at DESC);


--
-- Name: app_crm_visitors_instance_follow_up_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_crm_visitors_instance_follow_up_idx ON public.app_crm_visitors USING btree (instance_name, next_follow_up_at);


--
-- Name: app_crm_visitors_instance_stage_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_crm_visitors_instance_stage_idx ON public.app_crm_visitors USING btree (instance_name, stage, active);


--
-- Name: app_crm_visitors_owner_instance_stage_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_crm_visitors_owner_instance_stage_idx ON public.app_crm_visitors USING btree (owner_user_id, instance_name, stage, active);


--
-- Name: app_dispatch_job_items_job_sequence_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_dispatch_job_items_job_sequence_idx ON public.app_dispatch_job_items USING btree (job_id, sequence);


--
-- Name: app_dispatch_job_items_job_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_dispatch_job_items_job_status_idx ON public.app_dispatch_job_items USING btree (job_id, status);


--
-- Name: app_dispatch_jobs_instance_schedule_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_dispatch_jobs_instance_schedule_idx ON public.app_dispatch_jobs USING btree (instance_name, scheduled_for_utc DESC);


--
-- Name: app_dispatch_jobs_owner_status_schedule_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_dispatch_jobs_owner_status_schedule_idx ON public.app_dispatch_jobs USING btree (owner_user_id, status, scheduled_for_utc);


--
-- Name: app_dispatch_jobs_recurrence_schedule_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_dispatch_jobs_recurrence_schedule_idx ON public.app_dispatch_jobs USING btree (recurrence_rule_id, scheduled_for_utc) WHERE (recurrence_rule_id IS NOT NULL);


--
-- Name: app_dispatch_jobs_status_schedule_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_dispatch_jobs_status_schedule_idx ON public.app_dispatch_jobs USING btree (status, scheduled_for_utc);


--
-- Name: app_dispatch_jobs_unique_rule_occurrence_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_dispatch_jobs_unique_rule_occurrence_idx ON public.app_dispatch_jobs USING btree (recurrence_rule_id, scheduled_for_utc) WHERE (recurrence_rule_id IS NOT NULL);


--
-- Name: app_managed_instances_owner_created_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_managed_instances_owner_created_idx ON public.app_managed_instances USING btree (owner_user_id, created_at DESC);


--
-- Name: app_managed_instances_owner_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_managed_instances_owner_name_idx ON public.app_managed_instances USING btree (owner_user_id, name);


--
-- Name: app_media_assets_owner_instance_created_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_media_assets_owner_instance_created_idx ON public.app_media_assets USING btree (owner_user_id, instance_name, created_at DESC);


--
-- Name: app_official_group_favorites_owner_instance_group_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_official_group_favorites_owner_instance_group_idx ON public.app_official_group_favorites USING btree (owner_user_id, instance_name, group_id);


--
-- Name: app_recurrence_rules_active_next_run_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_recurrence_rules_active_next_run_idx ON public.app_recurrence_rules USING btree (active, next_run_at_utc);


--
-- Name: app_recurrence_rules_instance_active_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_recurrence_rules_instance_active_idx ON public.app_recurrence_rules USING btree (instance_name, active, next_run_at_utc);


--
-- Name: app_recurrence_rules_owner_active_next_run_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_recurrence_rules_owner_active_next_run_idx ON public.app_recurrence_rules USING btree (owner_user_id, active, next_run_at_utc);


--
-- Name: app_thread_messages_owner_thread_timestamp_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_thread_messages_owner_thread_timestamp_idx ON public.app_thread_messages USING btree (owner_user_id, thread_id, message_timestamp);


--
-- Name: app_thread_messages_thread_timestamp_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_thread_messages_thread_timestamp_idx ON public.app_thread_messages USING btree (thread_id, message_timestamp);


--
-- Name: app_worker_health_owner_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_worker_health_owner_status_idx ON public.app_worker_health USING btree (owner_user_id, last_status, updated_at DESC);


--
-- Name: app_worker_health_owner_worker_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX app_worker_health_owner_worker_key_idx ON public.app_worker_health USING btree (owner_user_id, worker_key);


--
-- Name: idx_annual_budgets_category_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_annual_budgets_category_year ON public.annual_budgets USING btree (category_id, year);


--
-- Name: idx_app_contacts_cleanup_backup_20260406_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_contacts_cleanup_backup_20260406_id ON public.app_contacts_cleanup_backup_20260406 USING btree (id);


--
-- Name: idx_app_contacts_cleanup_backup_20260406_run_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_contacts_cleanup_backup_20260406_run_at ON public.app_contacts_cleanup_backup_20260406 USING btree (run_at);


--
-- Name: idx_app_contacts_phone_norm_backup_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_contacts_phone_norm_backup_id ON public.app_contacts_phone_normalization_backup_20260407 USING btree (id);


--
-- Name: idx_app_contacts_phone_norm_backup_run_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_contacts_phone_norm_backup_run_at ON public.app_contacts_phone_normalization_backup_20260407 USING btree (run_at DESC);


--
-- Name: idx_app_document_files_folder; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_document_files_folder ON public.app_document_files USING btree (folder_id);


--
-- Name: idx_app_document_files_normalized_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_document_files_normalized_name ON public.app_document_files USING btree (normalized_name);


--
-- Name: idx_app_document_files_unique_name_per_folder; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_app_document_files_unique_name_per_folder ON public.app_document_files USING btree (COALESCE(folder_id, '00000000-0000-0000-0000-000000000000'::uuid), normalized_name);


--
-- Name: idx_app_document_folders_parent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_document_folders_parent ON public.app_document_folders USING btree (parent_folder_id);


--
-- Name: idx_app_document_folders_unique_name_per_parent; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_app_document_folders_unique_name_per_parent ON public.app_document_folders USING btree (COALESCE(parent_folder_id, '00000000-0000-0000-0000-000000000000'::uuid), normalized_name);


--
-- Name: idx_app_photo_albums_event_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_photo_albums_event_date ON public.app_photo_albums USING btree (event_date DESC);


--
-- Name: idx_app_photo_albums_publication_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_photo_albums_publication_status ON public.app_photo_albums USING btree (publication_status);


--
-- Name: idx_app_photo_albums_unique_culto_source; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_app_photo_albums_unique_culto_source ON public.app_photo_albums USING btree (source_kind, source_id) WHERE ((source_kind = 'culto'::text) AND (source_id IS NOT NULL));


--
-- Name: idx_app_photo_assets_album; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_app_photo_assets_album ON public.app_photo_assets USING btree (album_id, sort_order);


--
-- Name: idx_audit_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audit_logs_created_at ON public.audit_logs USING btree (created_at);


--
-- Name: idx_audit_logs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audit_logs_user_id ON public.audit_logs USING btree (user_id);


--
-- Name: idx_bible_highlights_user_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bible_highlights_user_created ON public.bible_highlights USING btree (user_id, created_at DESC);


--
-- Name: idx_budgets_category_month_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_budgets_category_month_year ON public.budgets USING btree (category_id, month, year);


--
-- Name: idx_categories_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_categories_code ON public.categories USING btree (code);


--
-- Name: idx_categories_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_categories_parent_id ON public.categories USING btree (parent_id);


--
-- Name: idx_categories_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_categories_type ON public.categories USING btree (type);


--
-- Name: idx_cells_slug_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_cells_slug_unique ON public.cells USING btree (slug) WHERE (slug IS NOT NULL);


--
-- Name: idx_devotional_blocks_day; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_blocks_day ON public.devotional_blocks USING btree (day_id);


--
-- Name: idx_devotional_blocks_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_blocks_order ON public.devotional_blocks USING btree (day_id, "order");


--
-- Name: idx_devotional_days_series; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_days_series ON public.devotional_days USING btree (series_id);


--
-- Name: idx_devotional_journal_day; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_journal_day ON public.devotional_journal USING btree (day_id);


--
-- Name: idx_devotional_journal_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_journal_user ON public.devotional_journal USING btree (user_id);


--
-- Name: idx_devotional_progress_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_progress_user ON public.devotional_progress USING btree (user_id);


--
-- Name: idx_devotional_series_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_devotional_series_tags ON public.devotional_series USING gin (tags);


--
-- Name: idx_event_costs_eventos_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_event_costs_eventos_event_id ON public.event_costs_eventos USING btree (event_id);


--
-- Name: idx_event_costs_eventos_paid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_event_costs_eventos_paid ON public.event_costs_eventos USING btree (paid);


--
-- Name: idx_events_eventos_original_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_events_eventos_original_event_id ON public.events_eventos USING btree (original_event_id);


--
-- Name: idx_events_eventos_space_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_events_eventos_space_id ON public.events_eventos USING btree (space_id);


--
-- Name: idx_events_eventos_start_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_events_eventos_start_date ON public.events_eventos USING btree (start_date);


--
-- Name: idx_events_eventos_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_events_eventos_status ON public.events_eventos USING btree (status);


--
-- Name: idx_events_eventos_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_events_eventos_user_id ON public.events_eventos USING btree (user_id);


--
-- Name: idx_habit_completions_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_habit_completions_date ON public.habit_completions USING btree (date);


--
-- Name: idx_habit_completions_habit_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_habit_completions_habit_date ON public.habit_completions USING btree (habit_id, date);


--
-- Name: idx_habits_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_habits_created_at ON public.habits USING btree (created_at);


--
-- Name: idx_habits_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_habits_user_id ON public.habits USING btree (user_id);


--
-- Name: idx_ids_author; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_author ON public.ilustracaoes_de_sermoes USING btree (author);


--
-- Name: idx_ids_author_pub; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_author_pub ON public.ilustracaoes_de_sermoes USING btree (author, published_at DESC);


--
-- Name: idx_ids_body_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_body_trgm ON public.ilustracaoes_de_sermoes USING gin (body_text public.gin_trgm_ops);


--
-- Name: idx_ids_content_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_content_type ON public.ilustracaoes_de_sermoes USING btree (content_type);


--
-- Name: idx_ids_published_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_published_at ON public.ilustracaoes_de_sermoes USING btree (published_at DESC);


--
-- Name: idx_ids_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_slug ON public.ilustracaoes_de_sermoes USING btree (slug);


--
-- Name: idx_ids_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_title_trgm ON public.ilustracaoes_de_sermoes USING gin (title public.gin_trgm_ops);


--
-- Name: idx_ids_type_pub; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_type_pub ON public.ilustracaoes_de_sermoes USING btree (content_type, published_at DESC);


--
-- Name: idx_ids_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ids_uuid ON public.ilustracaoes_de_sermoes USING btree (uuid);


--
-- Name: idx_ministries_target_audience; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ministries_target_audience ON public.ministries USING gin (target_audience);


--
-- Name: idx_prayer_requests_user_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prayer_requests_user_date ON public.prayer_requests USING btree (user_id, request_date DESC, created_at DESC);


--
-- Name: idx_registrations_eventos_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_registrations_eventos_event_id ON public.registrations_eventos USING btree (event_id);


--
-- Name: idx_registrations_eventos_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_registrations_eventos_group_id ON public.registrations_eventos USING btree (group_id);


--
-- Name: idx_registrations_eventos_paid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_registrations_eventos_paid ON public.registrations_eventos USING btree (paid);


--
-- Name: idx_registrations_eventos_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_registrations_eventos_user_id ON public.registrations_eventos USING btree (user_id);


--
-- Name: idx_registros_cultos_data_culto; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_registros_cultos_data_culto ON public.registros_cultos USING btree (data_culto DESC);


--
-- Name: idx_site_ifc_banners_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_banners_order ON public.site_ifc_home_banners USING btree (display_order, created_at DESC);


--
-- Name: idx_site_ifc_cell_highlights_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_cell_highlights_order ON public.site_ifc_cell_highlights USING btree (display_order, created_at DESC);


--
-- Name: idx_site_ifc_media_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_media_order ON public.site_ifc_media_highlights USING btree (display_order, created_at DESC);


--
-- Name: idx_site_ifc_pages_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_pages_order ON public.site_ifc_pages USING btree (display_order, created_at DESC);


--
-- Name: idx_site_ifc_pages_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_pages_slug ON public.site_ifc_pages USING btree (slug);


--
-- Name: idx_site_ifc_studies_published; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_studies_published ON public.site_ifc_studies USING btree (is_published, published_at DESC);


--
-- Name: idx_site_ifc_studies_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_site_ifc_studies_slug ON public.site_ifc_studies USING btree (slug);


--
-- Name: idx_spaces_eventos_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_spaces_eventos_user_id ON public.spaces_eventos USING btree (user_id);


--
-- Name: idx_transactions_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transactions_account_id ON public.transactions USING btree (account_id);


--
-- Name: idx_transactions_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transactions_category ON public.transactions USING btree (category);


--
-- Name: idx_transactions_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transactions_date ON public.transactions USING btree (transaction_date);


--
-- Name: idx_transactions_entry_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transactions_entry_type ON public.transactions USING btree (entry_type);


--
-- Name: idx_transactions_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transactions_user_id ON public.transactions USING btree (user_id);


--
-- Name: idx_user_notes_user_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_notes_user_date ON public.user_notes USING btree (user_id, note_date DESC, created_at DESC);


--
-- Name: idx_user_roles_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_roles_role ON public.user_roles USING btree (role);


--
-- Name: idx_user_roles_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_roles_user_id ON public.user_roles USING btree (user_id);


--
-- Name: idx_visitantes_cidade; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_cidade ON public.visitantes USING btree (cidade);


--
-- Name: idx_visitantes_data_submissao; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_data_submissao ON public.visitantes USING btree (data_submissao DESC);


--
-- Name: idx_visitantes_estado_civil; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_estado_civil ON public.visitantes USING btree (estado_civil);


--
-- Name: idx_visitantes_external_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_external_id ON public.visitantes USING btree (external_id);


--
-- Name: idx_visitantes_frequenta_igreja; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_frequenta_igreja ON public.visitantes USING btree (frequenta_igreja);


--
-- Name: idx_visitantes_nome; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_nome ON public.visitantes USING btree (nome);


--
-- Name: idx_visitantes_telefone; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_visitantes_telefone ON public.visitantes USING btree (telefone);


--
-- Name: initial_balances_account_type_year_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX initial_balances_account_type_year_idx ON public.initial_balances USING btree (account_type, year) WHERE ((account_type IS NOT NULL) AND (year IS NOT NULL));


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_18_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_18_inserted_at_topic_idx ON realtime.messages_2026_04_18 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_20_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_20_inserted_at_topic_idx ON realtime.messages_2026_04_20 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_21_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_21_inserted_at_topic_idx ON realtime.messages_2026_04_21 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_22_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_22_inserted_at_topic_idx ON realtime.messages_2026_04_22 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_23_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_23_inserted_at_topic_idx ON realtime.messages_2026_04_23 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_24_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_24_inserted_at_topic_idx ON realtime.messages_2026_04_24 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_iceberg_namespaces_bucket_id; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_iceberg_namespaces_bucket_id ON storage.iceberg_namespaces USING btree (bucket_id, name);


--
-- Name: idx_iceberg_tables_namespace_id; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_iceberg_tables_namespace_id ON storage.iceberg_tables USING btree (namespace_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: -
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: -
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2026_04_18_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_18_inserted_at_topic_idx;


--
-- Name: messages_2026_04_18_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_18_pkey;


--
-- Name: messages_2026_04_20_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_20_inserted_at_topic_idx;


--
-- Name: messages_2026_04_20_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_20_pkey;


--
-- Name: messages_2026_04_21_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_21_inserted_at_topic_idx;


--
-- Name: messages_2026_04_21_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_21_pkey;


--
-- Name: messages_2026_04_22_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_22_inserted_at_topic_idx;


--
-- Name: messages_2026_04_22_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_22_pkey;


--
-- Name: messages_2026_04_23_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_23_inserted_at_topic_idx;


--
-- Name: messages_2026_04_23_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_23_pkey;


--
-- Name: messages_2026_04_24_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_24_inserted_at_topic_idx;


--
-- Name: messages_2026_04_24_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_24_pkey;


--
-- Name: app_contact_aliases app_contact_aliases_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_contact_aliases_set_owner_user_id_trigger BEFORE INSERT ON public.app_contact_aliases FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_contact_threads app_contact_threads_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_contact_threads_set_owner_user_id_trigger BEFORE INSERT ON public.app_contact_threads FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_contacts app_contacts_sync_normalized_phone_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_contacts_sync_normalized_phone_trigger BEFORE INSERT OR UPDATE ON public.app_contacts FOR EACH ROW EXECUTE FUNCTION public.app_contacts_sync_normalized_phone();


--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_crm_visitor_activities_set_owner_user_id_trigger BEFORE INSERT ON public.app_crm_visitor_activities FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_crm_visitors app_crm_visitors_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_crm_visitors_set_owner_user_id_trigger BEFORE INSERT ON public.app_crm_visitors FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_custom_group_members app_custom_group_members_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_custom_group_members_set_owner_user_id_trigger BEFORE INSERT ON public.app_custom_group_members FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_custom_groups app_custom_groups_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_custom_groups_set_owner_user_id_trigger BEFORE INSERT ON public.app_custom_groups FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_dispatch_job_items app_dispatch_job_items_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_dispatch_job_items_set_owner_user_id_trigger BEFORE INSERT ON public.app_dispatch_job_items FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_dispatch_jobs app_dispatch_jobs_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_dispatch_jobs_set_owner_user_id_trigger BEFORE INSERT ON public.app_dispatch_jobs FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_document_files app_document_files_apply_defaults_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_document_files_apply_defaults_trigger BEFORE INSERT OR UPDATE ON public.app_document_files FOR EACH ROW EXECUTE FUNCTION public.document_files_apply_defaults();


--
-- Name: app_document_folders app_document_folders_apply_defaults_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_document_folders_apply_defaults_trigger BEFORE INSERT OR UPDATE ON public.app_document_folders FOR EACH ROW EXECUTE FUNCTION public.document_folders_apply_defaults();


--
-- Name: app_document_folders app_document_folders_prevent_cycles_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_document_folders_prevent_cycles_trigger BEFORE INSERT OR UPDATE OF parent_folder_id ON public.app_document_folders FOR EACH ROW EXECUTE FUNCTION public.document_folder_prevent_cycles();


--
-- Name: app_group_send_collection_items app_group_send_collection_items_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_group_send_collection_items_set_owner_user_id_trigger BEFORE INSERT ON public.app_group_send_collection_items FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_group_send_collections app_group_send_collections_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_group_send_collections_set_owner_user_id_trigger BEFORE INSERT ON public.app_group_send_collections FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_instances app_instances_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_instances_set_owner_user_id_trigger BEFORE INSERT ON public.app_instances FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_managed_instances app_managed_instances_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_managed_instances_set_owner_user_id_trigger BEFORE INSERT ON public.app_managed_instances FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_media_assets app_media_assets_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_media_assets_set_owner_user_id_trigger BEFORE INSERT ON public.app_media_assets FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_official_group_favorites app_official_group_favorites_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_official_group_favorites_set_owner_user_id_trigger BEFORE INSERT ON public.app_official_group_favorites FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_recurrence_rules app_recurrence_rules_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_recurrence_rules_set_owner_user_id_trigger BEFORE INSERT ON public.app_recurrence_rules FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_settings app_settings_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_settings_set_owner_user_id_trigger BEFORE INSERT ON public.app_settings FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_thread_messages app_thread_messages_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_thread_messages_set_owner_user_id_trigger BEFORE INSERT ON public.app_thread_messages FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: app_worker_health app_worker_health_set_owner_user_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER app_worker_health_set_owner_user_id_trigger BEFORE INSERT ON public.app_worker_health FOR EACH ROW EXECUTE FUNCTION public.app_set_owner_user_id();


--
-- Name: announcements update_announcements_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_announcements_updated_at BEFORE UPDATE ON public.announcements FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: app_notifications update_app_notifications_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_app_notifications_updated_at BEFORE UPDATE ON public.app_notifications FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: app_photo_albums update_app_photo_albums_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_app_photo_albums_updated_at BEFORE UPDATE ON public.app_photo_albums FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: app_photo_assets update_app_photo_assets_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_app_photo_assets_updated_at BEFORE UPDATE ON public.app_photo_assets FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: cells update_cells_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_cells_updated_at BEFORE UPDATE ON public.cells FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: church_schedules update_church_schedules_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_church_schedules_updated_at BEFORE UPDATE ON public.church_schedules FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: church_settings update_church_settings_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_church_settings_updated_at BEFORE UPDATE ON public.church_settings FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: contact_info update_contact_info_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_contact_info_updated_at BEFORE UPDATE ON public.contact_info FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: curricula update_curricula_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_curricula_updated_at BEFORE UPDATE ON public.curricula FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: discipleships update_discipleships_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_discipleships_updated_at BEFORE UPDATE ON public.discipleships FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: family_info update_family_info_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_family_info_updated_at BEFORE UPDATE ON public.family_info FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: giving_methods update_giving_methods_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_giving_methods_updated_at BEFORE UPDATE ON public.giving_methods FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: home_banners update_home_banners_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_home_banners_updated_at BEFORE UPDATE ON public.home_banners FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: institutional_pages update_institutional_pages_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_institutional_pages_updated_at BEFORE UPDATE ON public.institutional_pages FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: media_items update_media_items_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_media_items_updated_at BEFORE UPDATE ON public.media_items FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: media_series update_media_series_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_media_series_updated_at BEFORE UPDATE ON public.media_series FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: members update_members_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_members_updated_at BEFORE UPDATE ON public.members FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: ministerial_info update_ministerial_info_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_ministerial_info_updated_at BEFORE UPDATE ON public.ministerial_info FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: ministries update_ministries_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_ministries_updated_at BEFORE UPDATE ON public.ministries FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: other_info update_other_info_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_other_info_updated_at BEFORE UPDATE ON public.other_info FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: profiles update_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: registros_cultos update_registros_cultos_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_registros_cultos_updated_at BEFORE UPDATE ON public.registros_cultos FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: spiritual_info update_spiritual_info_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_spiritual_info_updated_at BEFORE UPDATE ON public.spiritual_info FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: visitantes update_visitantes_timestamp; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_visitantes_timestamp BEFORE UPDATE ON public.visitantes FOR EACH ROW EXECUTE FUNCTION public.update_visitantes_updated_at();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: -
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: access_logs access_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: accounts accounts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: annual_budgets annual_budgets_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annual_budgets
    ADD CONSTRAINT annual_budgets_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: app_contact_aliases app_contact_aliases_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contact_aliases
    ADD CONSTRAINT app_contact_aliases_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.app_contacts(id) ON DELETE CASCADE;


--
-- Name: app_contact_threads app_contact_threads_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_contact_threads
    ADD CONSTRAINT app_contact_threads_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.app_contacts(id) ON DELETE CASCADE;


--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_visitor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_visitor_activities
    ADD CONSTRAINT app_crm_visitor_activities_visitor_id_fkey FOREIGN KEY (visitor_id) REFERENCES public.app_crm_visitors(id) ON DELETE CASCADE;


--
-- Name: app_crm_visitors app_crm_visitors_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_visitors
    ADD CONSTRAINT app_crm_visitors_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.app_contacts(id) ON DELETE CASCADE;


--
-- Name: app_crm_visitors app_crm_visitors_thread_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_crm_visitors
    ADD CONSTRAINT app_crm_visitors_thread_id_fkey FOREIGN KEY (thread_id) REFERENCES public.app_contact_threads(id) ON DELETE CASCADE;


--
-- Name: app_custom_group_members app_custom_group_members_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_custom_group_members
    ADD CONSTRAINT app_custom_group_members_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.app_custom_groups(id) ON DELETE CASCADE;


--
-- Name: app_dispatch_job_items app_dispatch_job_items_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_dispatch_job_items
    ADD CONSTRAINT app_dispatch_job_items_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.app_dispatch_jobs(id) ON DELETE CASCADE;


--
-- Name: app_dispatch_jobs app_dispatch_jobs_recurrence_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_dispatch_jobs
    ADD CONSTRAINT app_dispatch_jobs_recurrence_rule_id_fkey FOREIGN KEY (recurrence_rule_id) REFERENCES public.app_recurrence_rules(id) ON DELETE SET NULL;


--
-- Name: app_document_files app_document_files_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_document_files
    ADD CONSTRAINT app_document_files_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.app_document_folders(id) ON DELETE RESTRICT;


--
-- Name: app_document_folders app_document_folders_parent_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_document_folders
    ADD CONSTRAINT app_document_folders_parent_folder_id_fkey FOREIGN KEY (parent_folder_id) REFERENCES public.app_document_folders(id) ON DELETE RESTRICT;


--
-- Name: app_group_send_collection_items app_group_send_collection_items_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_group_send_collection_items
    ADD CONSTRAINT app_group_send_collection_items_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.app_group_send_collections(id) ON DELETE CASCADE;


--
-- Name: app_photo_assets app_photo_assets_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_photo_assets
    ADD CONSTRAINT app_photo_assets_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.app_photo_albums(id) ON DELETE CASCADE;


--
-- Name: app_thread_messages app_thread_messages_thread_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_thread_messages
    ADD CONSTRAINT app_thread_messages_thread_id_fkey FOREIGN KEY (thread_id) REFERENCES public.app_contact_threads(id) ON DELETE CASCADE;


--
-- Name: bible_highlights bible_highlights_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bible_highlights
    ADD CONSTRAINT bible_highlights_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: budgets budgets_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: categories categories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: contact_info contact_info_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: devotional_blocks devotional_blocks_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_blocks
    ADD CONSTRAINT devotional_blocks_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.devotional_days(id) ON DELETE CASCADE;


--
-- Name: devotional_days devotional_days_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_days
    ADD CONSTRAINT devotional_days_series_id_fkey FOREIGN KEY (series_id) REFERENCES public.devotional_series(id) ON DELETE CASCADE;


--
-- Name: devotional_journal devotional_journal_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_journal
    ADD CONSTRAINT devotional_journal_block_id_fkey FOREIGN KEY (block_id) REFERENCES public.devotional_blocks(id);


--
-- Name: devotional_journal devotional_journal_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_journal
    ADD CONSTRAINT devotional_journal_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.devotional_days(id) ON DELETE CASCADE;


--
-- Name: devotional_journal devotional_journal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_journal
    ADD CONSTRAINT devotional_journal_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: devotional_media devotional_media_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_media
    ADD CONSTRAINT devotional_media_block_id_fkey FOREIGN KEY (block_id) REFERENCES public.devotional_blocks(id) ON DELETE CASCADE;


--
-- Name: devotional_progress devotional_progress_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_progress
    ADD CONSTRAINT devotional_progress_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.devotional_days(id) ON DELETE CASCADE;


--
-- Name: devotional_progress devotional_progress_last_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_progress
    ADD CONSTRAINT devotional_progress_last_block_id_fkey FOREIGN KEY (last_block_id) REFERENCES public.devotional_blocks(id);


--
-- Name: devotional_progress devotional_progress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devotional_progress
    ADD CONSTRAINT devotional_progress_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: discipleship_members discipleship_members_discipleship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discipleship_members
    ADD CONSTRAINT discipleship_members_discipleship_id_fkey FOREIGN KEY (discipleship_id) REFERENCES public.discipleships(id) ON DELETE CASCADE;


--
-- Name: discipleship_members discipleship_members_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discipleship_members
    ADD CONSTRAINT discipleship_members_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: discipleships discipleships_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discipleships
    ADD CONSTRAINT discipleships_curriculum_id_fkey FOREIGN KEY (curriculum_id) REFERENCES public.curricula(id);


--
-- Name: event_costs_eventos event_costs_eventos_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_costs_eventos
    ADD CONSTRAINT event_costs_eventos_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events_eventos(id) ON DELETE CASCADE;


--
-- Name: events_eventos events_eventos_original_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventos
    ADD CONSTRAINT events_eventos_original_event_id_fkey FOREIGN KEY (original_event_id) REFERENCES public.events_eventos(id) ON DELETE SET NULL;


--
-- Name: events_eventos events_eventos_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventos
    ADD CONSTRAINT events_eventos_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.spaces_eventos(id) ON DELETE SET NULL;


--
-- Name: events_eventos events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventos
    ADD CONSTRAINT events_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: family_info family_info_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.family_info
    ADD CONSTRAINT family_info_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: habit_completions habit_completions_habit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit_completions
    ADD CONSTRAINT habit_completions_habit_id_fkey FOREIGN KEY (habit_id) REFERENCES public.habits(id) ON DELETE CASCADE;


--
-- Name: habits habits_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habits
    ADD CONSTRAINT habits_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: ifc_user_roles ifc_user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ifc_user_roles
    ADD CONSTRAINT ifc_user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: initial_balances initial_balances_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.initial_balances
    ADD CONSTRAINT initial_balances_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- Name: media_items media_items_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_items
    ADD CONSTRAINT media_items_series_id_fkey FOREIGN KEY (series_id) REFERENCES public.media_series(id) ON DELETE SET NULL;


--
-- Name: member_availability member_availability_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_availability
    ADD CONSTRAINT member_availability_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: member_cells member_cells_cell_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_cells
    ADD CONSTRAINT member_cells_cell_id_fkey FOREIGN KEY (cell_id) REFERENCES public.cells(id) ON DELETE CASCADE;


--
-- Name: member_cells member_cells_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_cells
    ADD CONSTRAINT member_cells_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: member_courses member_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_courses
    ADD CONSTRAINT member_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: member_courses member_courses_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_courses
    ADD CONSTRAINT member_courses_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: member_gifts member_gifts_gift_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_gifts
    ADD CONSTRAINT member_gifts_gift_id_fkey FOREIGN KEY (gift_id) REFERENCES public.gifts(id) ON DELETE CASCADE;


--
-- Name: member_gifts member_gifts_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_gifts
    ADD CONSTRAINT member_gifts_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: member_ministries member_ministries_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_ministries
    ADD CONSTRAINT member_ministries_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: member_ministries member_ministries_ministry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_ministries
    ADD CONSTRAINT member_ministries_ministry_id_fkey FOREIGN KEY (ministry_id) REFERENCES public.ministries(id) ON DELETE CASCADE;


--
-- Name: member_talents member_talents_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_talents
    ADD CONSTRAINT member_talents_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: member_talents member_talents_talent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_talents
    ADD CONSTRAINT member_talents_talent_id_fkey FOREIGN KEY (talent_id) REFERENCES public.talents(id) ON DELETE CASCADE;


--
-- Name: members members_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.profiles(id);


--
-- Name: ministerial_info ministerial_info_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ministerial_info
    ADD CONSTRAINT ministerial_info_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: other_info other_info_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.other_info
    ADD CONSTRAINT other_info_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: prayer_requests prayer_requests_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prayer_requests
    ADD CONSTRAINT prayer_requests_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: receipts receipts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: registrations_eventos registrations_eventos_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registrations_eventos
    ADD CONSTRAINT registrations_eventos_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events_eventos(id) ON DELETE CASCADE;


--
-- Name: registrations_eventos registrations_eventos_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registrations_eventos
    ADD CONSTRAINT registrations_eventos_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.registrations_eventos(id) ON DELETE SET NULL;


--
-- Name: registrations_eventos registrations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registrations_eventos
    ADD CONSTRAINT registrations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: spaces_eventos spaces_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spaces_eventos
    ADD CONSTRAINT spaces_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: spiritual_info spiritual_info_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spiritual_info
    ADD CONSTRAINT spiritual_info_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: user_notes user_notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_notes
    ADD CONSTRAINT user_notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: iceberg_namespaces iceberg_namespaces_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_namespace_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_namespace_id_fkey FOREIGN KEY (namespace_id) REFERENCES storage.iceberg_namespaces(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: annual_budgets Admin e Secretary podem atualizar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem atualizar annual_budgets" ON public.annual_budgets FOR UPDATE TO authenticated USING (public.can_write()) WITH CHECK (public.can_write());


--
-- Name: categories Admin e Secretary podem atualizar categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem atualizar categories" ON public.categories FOR UPDATE TO authenticated USING (public.can_write()) WITH CHECK (public.can_write());


--
-- Name: initial_balances Admin e Secretary podem atualizar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem atualizar initial_balances" ON public.initial_balances FOR UPDATE TO authenticated USING (public.can_write()) WITH CHECK (public.can_write());


--
-- Name: receipts Admin e Secretary podem atualizar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem atualizar receipts" ON public.receipts FOR UPDATE TO authenticated USING (public.can_write()) WITH CHECK (public.can_write());


--
-- Name: transactions Admin e Secretary podem atualizar transactions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem atualizar transactions" ON public.transactions FOR UPDATE TO authenticated USING (public.can_write()) WITH CHECK (public.can_write());


--
-- Name: annual_budgets Admin e Secretary podem criar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem criar annual_budgets" ON public.annual_budgets FOR INSERT TO authenticated WITH CHECK (public.can_write());


--
-- Name: categories Admin e Secretary podem criar categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem criar categories" ON public.categories FOR INSERT TO authenticated WITH CHECK (public.can_write());


--
-- Name: initial_balances Admin e Secretary podem criar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem criar initial_balances" ON public.initial_balances FOR INSERT TO authenticated WITH CHECK (public.can_write());


--
-- Name: receipts Admin e Secretary podem criar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem criar receipts" ON public.receipts FOR INSERT TO authenticated WITH CHECK (public.can_write());


--
-- Name: transactions Admin e Secretary podem criar transactions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem criar transactions" ON public.transactions FOR INSERT TO authenticated WITH CHECK (public.can_write());


--
-- Name: annual_budgets Admin e Secretary podem deletar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem deletar annual_budgets" ON public.annual_budgets FOR DELETE TO authenticated USING (public.can_write());


--
-- Name: categories Admin e Secretary podem deletar categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem deletar categories" ON public.categories FOR DELETE TO authenticated USING (public.can_write());


--
-- Name: receipts Admin e Secretary podem deletar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem deletar receipts" ON public.receipts FOR DELETE TO authenticated USING (public.can_write());


--
-- Name: transactions Admin e Secretary podem deletar transactions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admin e Secretary podem deletar transactions" ON public.transactions FOR DELETE TO authenticated USING (public.can_write());


--
-- Name: devotional_blocks Admins can delete blocks; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can delete blocks" ON public.devotional_blocks FOR DELETE USING (public.is_admin());


--
-- Name: devotional_days Admins can delete days; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can delete days" ON public.devotional_days FOR DELETE USING (public.is_admin());


--
-- Name: devotional_media Admins can delete media; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can delete media" ON public.devotional_media FOR DELETE USING (public.is_admin());


--
-- Name: devotional_series Admins can delete series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can delete series" ON public.devotional_series FOR DELETE USING (public.is_admin());


--
-- Name: devotional_blocks Admins can insert blocks; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can insert blocks" ON public.devotional_blocks FOR INSERT WITH CHECK (public.is_admin());


--
-- Name: devotional_days Admins can insert days; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can insert days" ON public.devotional_days FOR INSERT WITH CHECK (public.is_admin());


--
-- Name: devotional_media Admins can insert media; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can insert media" ON public.devotional_media FOR INSERT WITH CHECK (public.is_admin());


--
-- Name: devotional_series Admins can insert series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can insert series" ON public.devotional_series FOR INSERT WITH CHECK (public.is_admin());


--
-- Name: devotional_blocks Admins can read blocks; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can read blocks" ON public.devotional_blocks FOR SELECT USING (public.is_admin());


--
-- Name: devotional_days Admins can read days; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can read days" ON public.devotional_days FOR SELECT USING (public.is_admin());


--
-- Name: devotional_media Admins can read media; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can read media" ON public.devotional_media FOR SELECT USING (public.is_admin());


--
-- Name: devotional_series Admins can read series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can read series" ON public.devotional_series FOR SELECT USING (public.is_admin());


--
-- Name: devotional_blocks Admins can update blocks; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can update blocks" ON public.devotional_blocks FOR UPDATE USING (public.is_admin()) WITH CHECK (public.is_admin());


--
-- Name: devotional_days Admins can update days; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can update days" ON public.devotional_days FOR UPDATE USING (public.is_admin()) WITH CHECK (public.is_admin());


--
-- Name: devotional_media Admins can update media; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can update media" ON public.devotional_media FOR UPDATE USING (public.is_admin()) WITH CHECK (public.is_admin());


--
-- Name: devotional_series Admins can update series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can update series" ON public.devotional_series FOR UPDATE USING (public.is_admin()) WITH CHECK (public.is_admin());


--
-- Name: registros_cultos Allow public delete to registros_cultos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow public delete to registros_cultos" ON public.registros_cultos FOR DELETE USING (true);


--
-- Name: registros_cultos Allow public insert to registros_cultos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow public insert to registros_cultos" ON public.registros_cultos FOR INSERT WITH CHECK (true);


--
-- Name: registros_cultos Allow public read access to registros_cultos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow public read access to registros_cultos" ON public.registros_cultos FOR SELECT USING (true);


--
-- Name: registros_cultos Allow public update to registros_cultos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow public update to registros_cultos" ON public.registros_cultos FOR UPDATE USING (true);


--
-- Name: user_roles Allow role creation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow role creation" ON public.user_roles FOR INSERT WITH CHECK (true);


--
-- Name: audit_logs Apenas service_role pode atualizar audit_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Apenas service_role pode atualizar audit_logs" ON public.audit_logs FOR UPDATE USING ((auth.role() = 'service_role'::text));


--
-- Name: audit_logs Apenas service_role pode deletar audit_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Apenas service_role pode deletar audit_logs" ON public.audit_logs FOR DELETE USING ((auth.role() = 'service_role'::text));


--
-- Name: cells Authenticated users can delete cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete cells" ON public.cells FOR DELETE TO authenticated USING (true);


--
-- Name: contact_info Authenticated users can delete contact_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete contact_info" ON public.contact_info FOR DELETE TO authenticated USING (true);


--
-- Name: courses Authenticated users can delete courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete courses" ON public.courses FOR DELETE TO authenticated USING (true);


--
-- Name: curricula Authenticated users can delete curricula; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete curricula" ON public.curricula FOR DELETE TO authenticated USING (true);


--
-- Name: discipleship_members Authenticated users can delete discipleship_members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete discipleship_members" ON public.discipleship_members FOR DELETE TO authenticated USING (true);


--
-- Name: discipleships Authenticated users can delete discipleships; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete discipleships" ON public.discipleships FOR DELETE TO authenticated USING (true);


--
-- Name: family_info Authenticated users can delete family_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete family_info" ON public.family_info FOR DELETE TO authenticated USING (true);


--
-- Name: gifts Authenticated users can delete gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete gifts" ON public.gifts FOR DELETE TO authenticated USING (true);


--
-- Name: member_availability Authenticated users can delete member_availability; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete member_availability" ON public.member_availability FOR DELETE TO authenticated USING (true);


--
-- Name: member_cells Authenticated users can delete member_cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete member_cells" ON public.member_cells FOR DELETE TO authenticated USING (true);


--
-- Name: member_courses Authenticated users can delete member_courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete member_courses" ON public.member_courses FOR DELETE TO authenticated USING (true);


--
-- Name: member_gifts Authenticated users can delete member_gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete member_gifts" ON public.member_gifts FOR DELETE TO authenticated USING (true);


--
-- Name: member_ministries Authenticated users can delete member_ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete member_ministries" ON public.member_ministries FOR DELETE TO authenticated USING (true);


--
-- Name: member_talents Authenticated users can delete member_talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete member_talents" ON public.member_talents FOR DELETE TO authenticated USING (true);


--
-- Name: members Authenticated users can delete members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete members" ON public.members FOR DELETE TO authenticated USING (true);


--
-- Name: ministerial_info Authenticated users can delete ministerial_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete ministerial_info" ON public.ministerial_info FOR DELETE TO authenticated USING (true);


--
-- Name: ministries Authenticated users can delete ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete ministries" ON public.ministries FOR DELETE TO authenticated USING (true);


--
-- Name: other_info Authenticated users can delete other_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete other_info" ON public.other_info FOR DELETE TO authenticated USING (true);


--
-- Name: spiritual_info Authenticated users can delete spiritual_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete spiritual_info" ON public.spiritual_info FOR DELETE TO authenticated USING (true);


--
-- Name: talents Authenticated users can delete talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can delete talents" ON public.talents FOR DELETE TO authenticated USING (true);


--
-- Name: cells Authenticated users can insert cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert cells" ON public.cells FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: contact_info Authenticated users can insert contact_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert contact_info" ON public.contact_info FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: courses Authenticated users can insert courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert courses" ON public.courses FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: curricula Authenticated users can insert curricula; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert curricula" ON public.curricula FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: discipleship_members Authenticated users can insert discipleship_members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert discipleship_members" ON public.discipleship_members FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: discipleships Authenticated users can insert discipleships; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert discipleships" ON public.discipleships FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: family_info Authenticated users can insert family_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert family_info" ON public.family_info FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: gifts Authenticated users can insert gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert gifts" ON public.gifts FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: audit_logs Authenticated users can insert logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert logs" ON public.audit_logs FOR INSERT WITH CHECK ((auth.uid() IS NOT NULL));


--
-- Name: member_availability Authenticated users can insert member_availability; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert member_availability" ON public.member_availability FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: member_cells Authenticated users can insert member_cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert member_cells" ON public.member_cells FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: member_courses Authenticated users can insert member_courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert member_courses" ON public.member_courses FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: member_gifts Authenticated users can insert member_gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert member_gifts" ON public.member_gifts FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: member_ministries Authenticated users can insert member_ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert member_ministries" ON public.member_ministries FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: member_talents Authenticated users can insert member_talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert member_talents" ON public.member_talents FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: members Authenticated users can insert members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert members" ON public.members FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: ministerial_info Authenticated users can insert ministerial_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert ministerial_info" ON public.ministerial_info FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: ministries Authenticated users can insert ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert ministries" ON public.ministries FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: other_info Authenticated users can insert other_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert other_info" ON public.other_info FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: spiritual_info Authenticated users can insert spiritual_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert spiritual_info" ON public.spiritual_info FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: talents Authenticated users can insert talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can insert talents" ON public.talents FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: cells Authenticated users can read cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read cells" ON public.cells FOR SELECT TO authenticated USING (true);


--
-- Name: contact_info Authenticated users can read contact_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read contact_info" ON public.contact_info FOR SELECT TO authenticated USING (true);


--
-- Name: courses Authenticated users can read courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read courses" ON public.courses FOR SELECT TO authenticated USING (true);


--
-- Name: curricula Authenticated users can read curricula; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read curricula" ON public.curricula FOR SELECT TO authenticated USING (true);


--
-- Name: discipleship_members Authenticated users can read discipleship_members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read discipleship_members" ON public.discipleship_members FOR SELECT TO authenticated USING (true);


--
-- Name: discipleships Authenticated users can read discipleships; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read discipleships" ON public.discipleships FOR SELECT TO authenticated USING (true);


--
-- Name: family_info Authenticated users can read family_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read family_info" ON public.family_info FOR SELECT TO authenticated USING (true);


--
-- Name: gifts Authenticated users can read gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read gifts" ON public.gifts FOR SELECT TO authenticated USING (true);


--
-- Name: member_availability Authenticated users can read member_availability; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read member_availability" ON public.member_availability FOR SELECT TO authenticated USING (true);


--
-- Name: member_cells Authenticated users can read member_cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read member_cells" ON public.member_cells FOR SELECT TO authenticated USING (true);


--
-- Name: member_courses Authenticated users can read member_courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read member_courses" ON public.member_courses FOR SELECT TO authenticated USING (true);


--
-- Name: member_gifts Authenticated users can read member_gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read member_gifts" ON public.member_gifts FOR SELECT TO authenticated USING (true);


--
-- Name: member_ministries Authenticated users can read member_ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read member_ministries" ON public.member_ministries FOR SELECT TO authenticated USING (true);


--
-- Name: member_talents Authenticated users can read member_talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read member_talents" ON public.member_talents FOR SELECT TO authenticated USING (true);


--
-- Name: members Authenticated users can read members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read members" ON public.members FOR SELECT TO authenticated USING (true);


--
-- Name: ministerial_info Authenticated users can read ministerial_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read ministerial_info" ON public.ministerial_info FOR SELECT TO authenticated USING (true);


--
-- Name: ministries Authenticated users can read ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read ministries" ON public.ministries FOR SELECT TO authenticated USING (true);


--
-- Name: other_info Authenticated users can read other_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read other_info" ON public.other_info FOR SELECT TO authenticated USING (true);


--
-- Name: spiritual_info Authenticated users can read spiritual_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read spiritual_info" ON public.spiritual_info FOR SELECT TO authenticated USING (true);


--
-- Name: talents Authenticated users can read talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can read talents" ON public.talents FOR SELECT TO authenticated USING (true);


--
-- Name: cells Authenticated users can update cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update cells" ON public.cells FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: contact_info Authenticated users can update contact_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update contact_info" ON public.contact_info FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: courses Authenticated users can update courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update courses" ON public.courses FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: curricula Authenticated users can update curricula; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update curricula" ON public.curricula FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: discipleship_members Authenticated users can update discipleship_members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update discipleship_members" ON public.discipleship_members FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: discipleships Authenticated users can update discipleships; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update discipleships" ON public.discipleships FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: family_info Authenticated users can update family_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update family_info" ON public.family_info FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: gifts Authenticated users can update gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update gifts" ON public.gifts FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: member_availability Authenticated users can update member_availability; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update member_availability" ON public.member_availability FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: member_cells Authenticated users can update member_cells; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update member_cells" ON public.member_cells FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: member_courses Authenticated users can update member_courses; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update member_courses" ON public.member_courses FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: member_gifts Authenticated users can update member_gifts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update member_gifts" ON public.member_gifts FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: member_ministries Authenticated users can update member_ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update member_ministries" ON public.member_ministries FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: member_talents Authenticated users can update member_talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update member_talents" ON public.member_talents FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: members Authenticated users can update members; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update members" ON public.members FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: ministerial_info Authenticated users can update ministerial_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update ministerial_info" ON public.ministerial_info FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: ministries Authenticated users can update ministries; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update ministries" ON public.ministries FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: other_info Authenticated users can update other_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update other_info" ON public.other_info FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: spiritual_info Authenticated users can update spiritual_info; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update spiritual_info" ON public.spiritual_info FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: talents Authenticated users can update talents; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can update talents" ON public.talents FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: app_document_files Managers can delete document files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can delete document files" ON public.app_document_files FOR DELETE TO authenticated USING (public.can_manage_documents());


--
-- Name: app_document_folders Managers can delete document folders; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can delete document folders" ON public.app_document_folders FOR DELETE TO authenticated USING (public.can_manage_documents());


--
-- Name: app_photo_albums Managers can delete photo albums; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can delete photo albums" ON public.app_photo_albums FOR DELETE TO authenticated USING (public.can_manage_photos());


--
-- Name: app_photo_assets Managers can delete photo assets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can delete photo assets" ON public.app_photo_assets FOR DELETE TO authenticated USING (public.can_manage_photos());


--
-- Name: app_document_files Managers can insert document files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can insert document files" ON public.app_document_files FOR INSERT TO authenticated WITH CHECK (public.can_manage_documents());


--
-- Name: app_document_folders Managers can insert document folders; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can insert document folders" ON public.app_document_folders FOR INSERT TO authenticated WITH CHECK (public.can_manage_documents());


--
-- Name: app_photo_albums Managers can insert photo albums; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can insert photo albums" ON public.app_photo_albums FOR INSERT TO authenticated WITH CHECK (public.can_manage_photos());


--
-- Name: app_photo_assets Managers can insert photo assets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can insert photo assets" ON public.app_photo_assets FOR INSERT TO authenticated WITH CHECK (public.can_manage_photos());


--
-- Name: announcements Managers can manage announcements; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage announcements" ON public.announcements TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: app_notifications Managers can manage app notifications; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage app notifications" ON public.app_notifications TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: church_settings Managers can manage church settings; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage church settings" ON public.church_settings TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: giving_methods Managers can manage giving methods; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage giving methods" ON public.giving_methods TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: home_banners Managers can manage home banners; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage home banners" ON public.home_banners TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: institutional_pages Managers can manage institutional pages; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage institutional pages" ON public.institutional_pages TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: media_items Managers can manage media items; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage media items" ON public.media_items TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: media_series Managers can manage media series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage media series" ON public.media_series TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: church_schedules Managers can manage schedules; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can manage schedules" ON public.church_schedules TO authenticated USING (public.can_manage_institutional_content()) WITH CHECK (public.can_manage_institutional_content());


--
-- Name: app_document_files Managers can read document files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can read document files" ON public.app_document_files FOR SELECT TO authenticated USING (public.can_manage_documents());


--
-- Name: app_document_folders Managers can read document folders; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can read document folders" ON public.app_document_folders FOR SELECT TO authenticated USING (public.can_manage_documents());


--
-- Name: app_photo_albums Managers can read photo albums; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can read photo albums" ON public.app_photo_albums FOR SELECT TO authenticated USING (public.can_manage_photos());


--
-- Name: app_photo_assets Managers can read photo assets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can read photo assets" ON public.app_photo_assets FOR SELECT TO authenticated USING (public.can_manage_photos());


--
-- Name: app_document_files Managers can update document files; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can update document files" ON public.app_document_files FOR UPDATE TO authenticated USING (public.can_manage_documents()) WITH CHECK (public.can_manage_documents());


--
-- Name: app_document_folders Managers can update document folders; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can update document folders" ON public.app_document_folders FOR UPDATE TO authenticated USING (public.can_manage_documents()) WITH CHECK (public.can_manage_documents());


--
-- Name: app_photo_albums Managers can update photo albums; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can update photo albums" ON public.app_photo_albums FOR UPDATE TO authenticated USING (public.can_manage_photos()) WITH CHECK (public.can_manage_photos());


--
-- Name: app_photo_assets Managers can update photo assets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Managers can update photo assets" ON public.app_photo_assets FOR UPDATE TO authenticated USING (public.can_manage_photos()) WITH CHECK (public.can_manage_photos());


--
-- Name: announcements Public can read active announcements; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read active announcements" ON public.announcements FOR SELECT TO authenticated, anon USING (((is_active = true) AND (published_at <= now()) AND ((expires_at IS NULL) OR (expires_at >= now()))));


--
-- Name: app_notifications Public can read active app notifications; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read active app notifications" ON public.app_notifications FOR SELECT TO authenticated, anon USING (((is_active = true) AND ((publish_at IS NULL) OR (publish_at <= now())) AND ((expires_at IS NULL) OR (expires_at >= now()))));


--
-- Name: giving_methods Public can read active giving methods; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read active giving methods" ON public.giving_methods FOR SELECT TO authenticated, anon USING ((is_active = true));


--
-- Name: home_banners Public can read active home banners; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read active home banners" ON public.home_banners FOR SELECT TO authenticated, anon USING (((is_active = true) AND ((starts_at IS NULL) OR (starts_at <= now())) AND ((ends_at IS NULL) OR (ends_at >= now()))));


--
-- Name: church_schedules Public can read active schedules; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read active schedules" ON public.church_schedules FOR SELECT TO authenticated, anon USING ((is_active = true));


--
-- Name: church_settings Public can read church settings; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read church settings" ON public.church_settings FOR SELECT TO authenticated, anon USING (true);


--
-- Name: media_items Public can read published media items; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read published media items" ON public.media_items FOR SELECT TO authenticated, anon USING (((is_published = true) AND (published_at <= now())));


--
-- Name: media_series Public can read published media series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read published media series" ON public.media_series FOR SELECT TO authenticated, anon USING ((is_published = true));


--
-- Name: institutional_pages Public can read published pages; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can read published pages" ON public.institutional_pages FOR SELECT TO authenticated, anon USING ((is_published = true));


--
-- Name: devotional_blocks Public read access for blocks; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public read access for blocks" ON public.devotional_blocks FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.devotional_days d
  WHERE ((d.id = devotional_blocks.day_id) AND (d.is_published = true)))));


--
-- Name: devotional_days Public read access for days; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public read access for days" ON public.devotional_days FOR SELECT USING ((is_published = true));


--
-- Name: devotional_media Public read access for media; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public read access for media" ON public.devotional_media FOR SELECT USING (true);


--
-- Name: devotional_series Public read access for series; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public read access for series" ON public.devotional_series FOR SELECT USING ((is_published = true));


--
-- Name: site_ifc_home_banners Site IFC banners delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC banners delete" ON public.site_ifc_home_banners FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_home_banners Site IFC banners insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC banners insert" ON public.site_ifc_home_banners FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_home_banners Site IFC banners public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC banners public read" ON public.site_ifc_home_banners FOR SELECT TO authenticated, anon USING (is_active);


--
-- Name: site_ifc_home_banners Site IFC banners read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC banners read" ON public.site_ifc_home_banners FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_home_banners Site IFC banners update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC banners update" ON public.site_ifc_home_banners FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_highlights Site IFC cell highlights delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell highlights delete" ON public.site_ifc_cell_highlights FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_highlights Site IFC cell highlights insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell highlights insert" ON public.site_ifc_cell_highlights FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_highlights Site IFC cell highlights public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell highlights public read" ON public.site_ifc_cell_highlights FOR SELECT TO authenticated, anon USING (is_active);


--
-- Name: site_ifc_cell_highlights Site IFC cell highlights read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell highlights read" ON public.site_ifc_cell_highlights FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_highlights Site IFC cell highlights update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell highlights update" ON public.site_ifc_cell_highlights FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_page_settings Site IFC cell settings delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell settings delete" ON public.site_ifc_cell_page_settings FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_page_settings Site IFC cell settings insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell settings insert" ON public.site_ifc_cell_page_settings FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_page_settings Site IFC cell settings public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell settings public read" ON public.site_ifc_cell_page_settings FOR SELECT TO authenticated, anon USING (true);


--
-- Name: site_ifc_cell_page_settings Site IFC cell settings read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell settings read" ON public.site_ifc_cell_page_settings FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_cell_page_settings Site IFC cell settings update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC cell settings update" ON public.site_ifc_cell_page_settings FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_giving_page_settings Site IFC giving settings delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC giving settings delete" ON public.site_ifc_giving_page_settings FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_giving_page_settings Site IFC giving settings insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC giving settings insert" ON public.site_ifc_giving_page_settings FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_giving_page_settings Site IFC giving settings public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC giving settings public read" ON public.site_ifc_giving_page_settings FOR SELECT TO authenticated, anon USING (true);


--
-- Name: site_ifc_giving_page_settings Site IFC giving settings read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC giving settings read" ON public.site_ifc_giving_page_settings FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_giving_page_settings Site IFC giving settings update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC giving settings update" ON public.site_ifc_giving_page_settings FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_media_highlights Site IFC media delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC media delete" ON public.site_ifc_media_highlights FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_media_highlights Site IFC media insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC media insert" ON public.site_ifc_media_highlights FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_media_highlights Site IFC media public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC media public read" ON public.site_ifc_media_highlights FOR SELECT TO authenticated, anon USING (is_active);


--
-- Name: site_ifc_media_highlights Site IFC media read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC media read" ON public.site_ifc_media_highlights FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_media_highlights Site IFC media update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC media update" ON public.site_ifc_media_highlights FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_pages Site IFC pages delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC pages delete" ON public.site_ifc_pages FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_pages Site IFC pages insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC pages insert" ON public.site_ifc_pages FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_pages Site IFC pages public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC pages public read" ON public.site_ifc_pages FOR SELECT TO authenticated, anon USING (is_published);


--
-- Name: site_ifc_pages Site IFC pages read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC pages read" ON public.site_ifc_pages FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_pages Site IFC pages update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC pages update" ON public.site_ifc_pages FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_settings Site IFC settings delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC settings delete" ON public.site_ifc_settings FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_settings Site IFC settings insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC settings insert" ON public.site_ifc_settings FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_settings Site IFC settings public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC settings public read" ON public.site_ifc_settings FOR SELECT TO authenticated, anon USING (true);


--
-- Name: site_ifc_settings Site IFC settings read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC settings read" ON public.site_ifc_settings FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_settings Site IFC settings update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC settings update" ON public.site_ifc_settings FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_studies Site IFC studies delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC studies delete" ON public.site_ifc_studies FOR DELETE TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_studies Site IFC studies insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC studies insert" ON public.site_ifc_studies FOR INSERT TO authenticated WITH CHECK (public.can_manage_site_ifc());


--
-- Name: site_ifc_studies Site IFC studies public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC studies public read" ON public.site_ifc_studies FOR SELECT TO authenticated, anon USING (is_published);


--
-- Name: site_ifc_studies Site IFC studies read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC studies read" ON public.site_ifc_studies FOR SELECT TO authenticated USING (public.can_manage_site_ifc());


--
-- Name: site_ifc_studies Site IFC studies update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Site IFC studies update" ON public.site_ifc_studies FOR UPDATE TO authenticated USING (public.can_manage_site_ifc()) WITH CHECK (public.can_manage_site_ifc());


--
-- Name: annual_budgets Todos autenticados podem atualizar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar annual_budgets" ON public.annual_budgets FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: budgets Todos autenticados podem atualizar budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar budgets" ON public.budgets FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: categories Todos autenticados podem atualizar categorias; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar categorias" ON public.categories FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: accounts Todos autenticados podem atualizar contas; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar contas" ON public.accounts FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: initial_balances Todos autenticados podem atualizar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar initial_balances" ON public.initial_balances FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: offerers Todos autenticados podem atualizar offerers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar offerers" ON public.offerers FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: receipts Todos autenticados podem atualizar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar receipts" ON public.receipts FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: tithers Todos autenticados podem atualizar tithers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar tithers" ON public.tithers FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: transactions Todos autenticados podem atualizar transações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem atualizar transações" ON public.transactions FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- Name: annual_budgets Todos autenticados podem criar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar annual_budgets" ON public.annual_budgets FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: audit_logs Todos autenticados podem criar audit_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar audit_logs" ON public.audit_logs FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: budgets Todos autenticados podem criar budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar budgets" ON public.budgets FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: categories Todos autenticados podem criar categorias; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar categorias" ON public.categories FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: accounts Todos autenticados podem criar contas; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar contas" ON public.accounts FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: initial_balances Todos autenticados podem criar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar initial_balances" ON public.initial_balances FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: offerers Todos autenticados podem criar offerers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar offerers" ON public.offerers FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: receipts Todos autenticados podem criar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar receipts" ON public.receipts FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: tithers Todos autenticados podem criar tithers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar tithers" ON public.tithers FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: transactions Todos autenticados podem criar transações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem criar transações" ON public.transactions FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: annual_budgets Todos autenticados podem deletar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar annual_budgets" ON public.annual_budgets FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: budgets Todos autenticados podem deletar budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar budgets" ON public.budgets FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: categories Todos autenticados podem deletar categorias; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar categorias" ON public.categories FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: accounts Todos autenticados podem deletar contas; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar contas" ON public.accounts FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: initial_balances Todos autenticados podem deletar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar initial_balances" ON public.initial_balances FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: offerers Todos autenticados podem deletar offerers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar offerers" ON public.offerers FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: receipts Todos autenticados podem deletar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar receipts" ON public.receipts FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: tithers Todos autenticados podem deletar tithers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar tithers" ON public.tithers FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: transactions Todos autenticados podem deletar transações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem deletar transações" ON public.transactions FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- Name: annual_budgets Todos autenticados podem visualizar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar annual_budgets" ON public.annual_budgets FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: audit_logs Todos autenticados podem visualizar audit_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar audit_logs" ON public.audit_logs FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: budgets Todos autenticados podem visualizar budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar budgets" ON public.budgets FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: categories Todos autenticados podem visualizar categorias; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar categorias" ON public.categories FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: accounts Todos autenticados podem visualizar contas; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar contas" ON public.accounts FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: initial_balances Todos autenticados podem visualizar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar initial_balances" ON public.initial_balances FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: offerers Todos autenticados podem visualizar offerers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar offerers" ON public.offerers FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: receipts Todos autenticados podem visualizar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar receipts" ON public.receipts FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: tithers Todos autenticados podem visualizar tithers; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar tithers" ON public.tithers FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: transactions Todos autenticados podem visualizar transações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos autenticados podem visualizar transações" ON public.transactions FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: visitantes Todos podem atualizar visitantes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem atualizar visitantes" ON public.visitantes FOR UPDATE USING (true);


--
-- Name: audit_logs Todos podem criar audit_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem criar audit_logs" ON public.audit_logs FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: visitantes Todos podem deletar visitantes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem deletar visitantes" ON public.visitantes FOR DELETE USING (true);


--
-- Name: visitantes Todos podem inserir visitantes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem inserir visitantes" ON public.visitantes FOR INSERT WITH CHECK (true);


--
-- Name: annual_budgets Todos podem visualizar annual_budgets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar annual_budgets" ON public.annual_budgets FOR SELECT TO authenticated USING (true);


--
-- Name: audit_logs Todos podem visualizar audit_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar audit_logs" ON public.audit_logs FOR SELECT TO authenticated USING (true);


--
-- Name: categories Todos podem visualizar categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar categories" ON public.categories FOR SELECT TO authenticated USING (true);


--
-- Name: initial_balances Todos podem visualizar initial_balances; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar initial_balances" ON public.initial_balances FOR SELECT TO authenticated USING (true);


--
-- Name: receipts Todos podem visualizar receipts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar receipts" ON public.receipts FOR SELECT TO authenticated USING (true);


--
-- Name: transactions Todos podem visualizar transactions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar transactions" ON public.transactions FOR SELECT TO authenticated USING (true);


--
-- Name: visitantes Todos podem visualizar visitantes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Todos podem visualizar visitantes" ON public.visitantes FOR SELECT USING (true);


--
-- Name: habit_completions Users can delete own habit_completions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can delete own habit_completions" ON public.habit_completions FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.habits h
  WHERE ((h.id = habit_completions.habit_id) AND (h.user_id = auth.uid())))));


--
-- Name: habits Users can delete own habits; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can delete own habits" ON public.habits FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: accounts Users can insert accounts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can insert accounts" ON public.accounts FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: habit_completions Users can insert own habit_completions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can insert own habit_completions" ON public.habit_completions FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.habits h
  WHERE ((h.id = habit_completions.habit_id) AND (h.user_id = auth.uid())))));


--
-- Name: habits Users can insert own habits; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can insert own habits" ON public.habits FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: bible_highlights Users can manage own bible highlights; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can manage own bible highlights" ON public.bible_highlights USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: devotional_journal Users can manage own journal; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can manage own journal" ON public.devotional_journal USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: user_notes Users can manage own notes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can manage own notes" ON public.user_notes USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: prayer_requests Users can manage own prayer requests; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can manage own prayer requests" ON public.prayer_requests USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: devotional_progress Users can manage own progress; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can manage own progress" ON public.devotional_progress USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: admin_users Users can read own admin membership; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can read own admin membership" ON public.admin_users FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: habit_completions Users can read own habit_completions; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can read own habit_completions" ON public.habit_completions FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.habits h
  WHERE ((h.id = habit_completions.habit_id) AND (h.user_id = auth.uid())))));


--
-- Name: habits Users can read own habits; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can read own habits" ON public.habits FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: habits Users can update own habits; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can update own habits" ON public.habits FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: accounts Users can view all accounts; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view all accounts" ON public.accounts FOR SELECT TO authenticated USING (true);


--
-- Name: user_roles Users can view own roles; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view own roles" ON public.user_roles FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: audit_logs Users view own logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users view own logs" ON public.audit_logs FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: accounts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.accounts ENABLE ROW LEVEL SECURITY;

--
-- Name: admin_users; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.admin_users ENABLE ROW LEVEL SECURITY;

--
-- Name: announcements; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.announcements ENABLE ROW LEVEL SECURITY;

--
-- Name: annual_budgets; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.annual_budgets ENABLE ROW LEVEL SECURITY;

--
-- Name: app_contact_aliases; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_contact_aliases ENABLE ROW LEVEL SECURITY;

--
-- Name: app_contact_aliases app_contact_aliases_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_aliases_owner_delete ON public.app_contact_aliases FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_contact_aliases app_contact_aliases_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_aliases_owner_insert ON public.app_contact_aliases FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_contact_aliases app_contact_aliases_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_aliases_owner_select ON public.app_contact_aliases FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_contact_aliases app_contact_aliases_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_aliases_owner_update ON public.app_contact_aliases FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_contact_threads; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_contact_threads ENABLE ROW LEVEL SECURITY;

--
-- Name: app_contact_threads app_contact_threads_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_threads_owner_delete ON public.app_contact_threads FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_contact_threads app_contact_threads_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_threads_owner_insert ON public.app_contact_threads FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_contact_threads app_contact_threads_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_threads_owner_select ON public.app_contact_threads FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_contact_threads app_contact_threads_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contact_threads_owner_update ON public.app_contact_threads FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_contacts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_contacts ENABLE ROW LEVEL SECURITY;

--
-- Name: app_contacts app_contacts_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contacts_owner_delete ON public.app_contacts FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_contacts app_contacts_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contacts_owner_insert ON public.app_contacts FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_contacts app_contacts_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contacts_owner_select ON public.app_contacts FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_contacts app_contacts_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_contacts_owner_update ON public.app_contacts FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_crm_runtime_lock; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_crm_runtime_lock ENABLE ROW LEVEL SECURITY;

--
-- Name: app_crm_visitor_activities; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_crm_visitor_activities ENABLE ROW LEVEL SECURITY;

--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitor_activities_owner_delete ON public.app_crm_visitor_activities FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitor_activities_owner_insert ON public.app_crm_visitor_activities FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitor_activities_owner_select ON public.app_crm_visitor_activities FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitor_activities app_crm_visitor_activities_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitor_activities_owner_update ON public.app_crm_visitor_activities FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitors; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_crm_visitors ENABLE ROW LEVEL SECURITY;

--
-- Name: app_crm_visitors app_crm_visitors_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitors_owner_delete ON public.app_crm_visitors FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitors app_crm_visitors_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitors_owner_insert ON public.app_crm_visitors FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitors app_crm_visitors_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitors_owner_select ON public.app_crm_visitors FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_crm_visitors app_crm_visitors_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_crm_visitors_owner_update ON public.app_crm_visitors FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_custom_group_members; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_custom_group_members ENABLE ROW LEVEL SECURITY;

--
-- Name: app_custom_group_members app_custom_group_members_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_group_members_owner_delete ON public.app_custom_group_members FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_custom_group_members app_custom_group_members_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_group_members_owner_insert ON public.app_custom_group_members FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_custom_group_members app_custom_group_members_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_group_members_owner_select ON public.app_custom_group_members FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_custom_group_members app_custom_group_members_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_group_members_owner_update ON public.app_custom_group_members FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_custom_groups; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_custom_groups ENABLE ROW LEVEL SECURITY;

--
-- Name: app_custom_groups app_custom_groups_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_groups_owner_delete ON public.app_custom_groups FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_custom_groups app_custom_groups_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_groups_owner_insert ON public.app_custom_groups FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_custom_groups app_custom_groups_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_groups_owner_select ON public.app_custom_groups FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_custom_groups app_custom_groups_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_custom_groups_owner_update ON public.app_custom_groups FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_job_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_dispatch_job_items ENABLE ROW LEVEL SECURITY;

--
-- Name: app_dispatch_job_items app_dispatch_job_items_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_job_items_owner_delete ON public.app_dispatch_job_items FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_job_items app_dispatch_job_items_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_job_items_owner_insert ON public.app_dispatch_job_items FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_job_items app_dispatch_job_items_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_job_items_owner_select ON public.app_dispatch_job_items FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_job_items app_dispatch_job_items_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_job_items_owner_update ON public.app_dispatch_job_items FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_jobs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_dispatch_jobs ENABLE ROW LEVEL SECURITY;

--
-- Name: app_dispatch_jobs app_dispatch_jobs_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_jobs_owner_delete ON public.app_dispatch_jobs FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_jobs app_dispatch_jobs_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_jobs_owner_insert ON public.app_dispatch_jobs FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_jobs app_dispatch_jobs_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_jobs_owner_select ON public.app_dispatch_jobs FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_jobs app_dispatch_jobs_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_dispatch_jobs_owner_update ON public.app_dispatch_jobs FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_dispatch_runtime_lock; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_dispatch_runtime_lock ENABLE ROW LEVEL SECURITY;

--
-- Name: app_document_files; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_document_files ENABLE ROW LEVEL SECURITY;

--
-- Name: app_document_folders; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_document_folders ENABLE ROW LEVEL SECURITY;

--
-- Name: app_group_send_collection_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_group_send_collection_items ENABLE ROW LEVEL SECURITY;

--
-- Name: app_group_send_collection_items app_group_send_collection_items_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collection_items_owner_delete ON public.app_group_send_collection_items FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collection_items app_group_send_collection_items_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collection_items_owner_insert ON public.app_group_send_collection_items FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collection_items app_group_send_collection_items_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collection_items_owner_select ON public.app_group_send_collection_items FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collection_items app_group_send_collection_items_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collection_items_owner_update ON public.app_group_send_collection_items FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collections; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_group_send_collections ENABLE ROW LEVEL SECURITY;

--
-- Name: app_group_send_collections app_group_send_collections_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collections_owner_delete ON public.app_group_send_collections FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collections app_group_send_collections_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collections_owner_insert ON public.app_group_send_collections FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collections app_group_send_collections_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collections_owner_select ON public.app_group_send_collections FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_group_send_collections app_group_send_collections_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_group_send_collections_owner_update ON public.app_group_send_collections FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_instances; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_instances ENABLE ROW LEVEL SECURITY;

--
-- Name: app_instances app_instances_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_instances_owner_delete ON public.app_instances FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_instances app_instances_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_instances_owner_insert ON public.app_instances FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_instances app_instances_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_instances_owner_select ON public.app_instances FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_instances app_instances_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_instances_owner_update ON public.app_instances FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_managed_instances; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_managed_instances ENABLE ROW LEVEL SECURITY;

--
-- Name: app_managed_instances app_managed_instances_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_managed_instances_owner_delete ON public.app_managed_instances FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_managed_instances app_managed_instances_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_managed_instances_owner_insert ON public.app_managed_instances FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_managed_instances app_managed_instances_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_managed_instances_owner_select ON public.app_managed_instances FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_managed_instances app_managed_instances_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_managed_instances_owner_update ON public.app_managed_instances FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_media_assets; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_media_assets ENABLE ROW LEVEL SECURITY;

--
-- Name: app_media_assets app_media_assets_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_media_assets_owner_delete ON public.app_media_assets FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_media_assets app_media_assets_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_media_assets_owner_insert ON public.app_media_assets FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_media_assets app_media_assets_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_media_assets_owner_select ON public.app_media_assets FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_media_assets app_media_assets_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_media_assets_owner_update ON public.app_media_assets FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_notifications; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_notifications ENABLE ROW LEVEL SECURITY;

--
-- Name: app_official_group_favorites; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_official_group_favorites ENABLE ROW LEVEL SECURITY;

--
-- Name: app_official_group_favorites app_official_group_favorites_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_official_group_favorites_owner_delete ON public.app_official_group_favorites FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_official_group_favorites app_official_group_favorites_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_official_group_favorites_owner_insert ON public.app_official_group_favorites FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_official_group_favorites app_official_group_favorites_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_official_group_favorites_owner_select ON public.app_official_group_favorites FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_official_group_favorites app_official_group_favorites_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_official_group_favorites_owner_update ON public.app_official_group_favorites FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_photo_albums; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_photo_albums ENABLE ROW LEVEL SECURITY;

--
-- Name: app_photo_assets; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_photo_assets ENABLE ROW LEVEL SECURITY;

--
-- Name: app_recurrence_rules; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_recurrence_rules ENABLE ROW LEVEL SECURITY;

--
-- Name: app_recurrence_rules app_recurrence_rules_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_recurrence_rules_owner_delete ON public.app_recurrence_rules FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_recurrence_rules app_recurrence_rules_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_recurrence_rules_owner_insert ON public.app_recurrence_rules FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_recurrence_rules app_recurrence_rules_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_recurrence_rules_owner_select ON public.app_recurrence_rules FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_recurrence_rules app_recurrence_rules_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_recurrence_rules_owner_update ON public.app_recurrence_rules FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: app_settings app_settings_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_settings_owner_delete ON public.app_settings FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_settings app_settings_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_settings_owner_insert ON public.app_settings FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_settings app_settings_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_settings_owner_select ON public.app_settings FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_settings app_settings_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_settings_owner_update ON public.app_settings FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_thread_messages; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_thread_messages ENABLE ROW LEVEL SECURITY;

--
-- Name: app_thread_messages app_thread_messages_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_thread_messages_owner_delete ON public.app_thread_messages FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_thread_messages app_thread_messages_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_thread_messages_owner_insert ON public.app_thread_messages FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_thread_messages app_thread_messages_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_thread_messages_owner_select ON public.app_thread_messages FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_thread_messages app_thread_messages_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_thread_messages_owner_update ON public.app_thread_messages FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_worker_health; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.app_worker_health ENABLE ROW LEVEL SECURITY;

--
-- Name: app_worker_health app_worker_health_owner_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_worker_health_owner_delete ON public.app_worker_health FOR DELETE TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_worker_health app_worker_health_owner_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_worker_health_owner_insert ON public.app_worker_health FOR INSERT TO authenticated WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: app_worker_health app_worker_health_owner_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_worker_health_owner_select ON public.app_worker_health FOR SELECT TO authenticated USING ((owner_user_id = auth.uid()));


--
-- Name: app_worker_health app_worker_health_owner_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY app_worker_health_owner_update ON public.app_worker_health FOR UPDATE TO authenticated USING ((owner_user_id = auth.uid())) WITH CHECK ((owner_user_id = auth.uid()));


--
-- Name: audit_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: audit_logs authenticated_users_insert_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY authenticated_users_insert_logs ON public.audit_logs FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: audit_logs authenticated_users_read_logs; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY authenticated_users_read_logs ON public.audit_logs FOR SELECT TO authenticated USING (true);


--
-- Name: bible_highlights; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.bible_highlights ENABLE ROW LEVEL SECURITY;

--
-- Name: budgets; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.budgets ENABLE ROW LEVEL SECURITY;

--
-- Name: categories; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;

--
-- Name: cells; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.cells ENABLE ROW LEVEL SECURITY;

--
-- Name: church_schedules; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.church_schedules ENABLE ROW LEVEL SECURITY;

--
-- Name: church_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.church_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: contact_info; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.contact_info ENABLE ROW LEVEL SECURITY;

--
-- Name: courses; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;

--
-- Name: curricula; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.curricula ENABLE ROW LEVEL SECURITY;

--
-- Name: devotional_blocks; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.devotional_blocks ENABLE ROW LEVEL SECURITY;

--
-- Name: devotional_days; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.devotional_days ENABLE ROW LEVEL SECURITY;

--
-- Name: devotional_journal; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.devotional_journal ENABLE ROW LEVEL SECURITY;

--
-- Name: devotional_media; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.devotional_media ENABLE ROW LEVEL SECURITY;

--
-- Name: devotional_progress; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.devotional_progress ENABLE ROW LEVEL SECURITY;

--
-- Name: devotional_series; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.devotional_series ENABLE ROW LEVEL SECURITY;

--
-- Name: discipleship_members; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.discipleship_members ENABLE ROW LEVEL SECURITY;

--
-- Name: discipleships; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.discipleships ENABLE ROW LEVEL SECURITY;

--
-- Name: event_costs_eventos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.event_costs_eventos ENABLE ROW LEVEL SECURITY;

--
-- Name: event_costs_eventos event_costs_eventos_temp_allow_all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY event_costs_eventos_temp_allow_all ON public.event_costs_eventos USING (true) WITH CHECK (true);


--
-- Name: events_eventos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.events_eventos ENABLE ROW LEVEL SECURITY;

--
-- Name: events_eventos events_eventos_temp_allow_all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY events_eventos_temp_allow_all ON public.events_eventos USING (true) WITH CHECK (true);


--
-- Name: family_info; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.family_info ENABLE ROW LEVEL SECURITY;

--
-- Name: gifts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.gifts ENABLE ROW LEVEL SECURITY;

--
-- Name: giving_methods; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.giving_methods ENABLE ROW LEVEL SECURITY;

--
-- Name: habit_completions; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.habit_completions ENABLE ROW LEVEL SECURITY;

--
-- Name: habits; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.habits ENABLE ROW LEVEL SECURITY;

--
-- Name: home_banners; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.home_banners ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles ifc_profiles_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_profiles_insert ON public.profiles FOR INSERT WITH CHECK ((auth.uid() = id));


--
-- Name: profiles ifc_profiles_own_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_profiles_own_select ON public.profiles FOR SELECT USING ((auth.uid() = id));


--
-- Name: profiles ifc_profiles_pastor_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_profiles_pastor_select ON public.profiles FOR SELECT USING (public.ifc_has_role(auth.uid(), 'pastor'::public.ifc_role));


--
-- Name: profiles ifc_profiles_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_profiles_update ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- Name: ifc_user_roles ifc_roles_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_roles_own ON public.ifc_user_roles FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: ifc_user_roles ifc_roles_pastor_delete; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_roles_pastor_delete ON public.ifc_user_roles FOR DELETE USING (public.ifc_has_role(auth.uid(), 'pastor'::public.ifc_role));


--
-- Name: ifc_user_roles ifc_roles_pastor_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_roles_pastor_insert ON public.ifc_user_roles FOR INSERT WITH CHECK (public.ifc_has_role(auth.uid(), 'pastor'::public.ifc_role));


--
-- Name: ifc_user_roles ifc_roles_pastor_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_roles_pastor_select ON public.ifc_user_roles FOR SELECT USING (public.ifc_has_role(auth.uid(), 'pastor'::public.ifc_role));


--
-- Name: ifc_user_roles ifc_roles_pastor_update; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY ifc_roles_pastor_update ON public.ifc_user_roles FOR UPDATE USING (public.ifc_has_role(auth.uid(), 'pastor'::public.ifc_role));


--
-- Name: ifc_user_roles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.ifc_user_roles ENABLE ROW LEVEL SECURITY;

--
-- Name: ilustracaoes_de_sermoes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.ilustracaoes_de_sermoes ENABLE ROW LEVEL SECURITY;

--
-- Name: initial_balances; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.initial_balances ENABLE ROW LEVEL SECURITY;

--
-- Name: institutional_pages; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.institutional_pages ENABLE ROW LEVEL SECURITY;

--
-- Name: media_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.media_items ENABLE ROW LEVEL SECURITY;

--
-- Name: media_series; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.media_series ENABLE ROW LEVEL SECURITY;

--
-- Name: member_availability; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.member_availability ENABLE ROW LEVEL SECURITY;

--
-- Name: member_cells; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.member_cells ENABLE ROW LEVEL SECURITY;

--
-- Name: member_courses; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.member_courses ENABLE ROW LEVEL SECURITY;

--
-- Name: member_gifts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.member_gifts ENABLE ROW LEVEL SECURITY;

--
-- Name: member_ministries; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.member_ministries ENABLE ROW LEVEL SECURITY;

--
-- Name: member_talents; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.member_talents ENABLE ROW LEVEL SECURITY;

--
-- Name: members; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.members ENABLE ROW LEVEL SECURITY;

--
-- Name: ministerial_info; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.ministerial_info ENABLE ROW LEVEL SECURITY;

--
-- Name: ministries; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.ministries ENABLE ROW LEVEL SECURITY;

--
-- Name: offerers; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.offerers ENABLE ROW LEVEL SECURITY;

--
-- Name: other_info; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.other_info ENABLE ROW LEVEL SECURITY;

--
-- Name: prayer_requests; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.prayer_requests ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles profiles_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY profiles_select_own ON public.profiles FOR SELECT TO authenticated USING ((auth.uid() = id));


--
-- Name: profiles profiles_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY profiles_update_own ON public.profiles FOR UPDATE TO authenticated USING ((auth.uid() = id));


--
-- Name: ilustracaoes_de_sermoes read_ilustracaoes_de_sermoes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY read_ilustracaoes_de_sermoes ON public.ilustracaoes_de_sermoes FOR SELECT TO authenticated, anon USING (true);


--
-- Name: receipts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.receipts ENABLE ROW LEVEL SECURITY;

--
-- Name: registrations_eventos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.registrations_eventos ENABLE ROW LEVEL SECURITY;

--
-- Name: registrations_eventos registrations_eventos_temp_allow_all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY registrations_eventos_temp_allow_all ON public.registrations_eventos USING (true) WITH CHECK (true);


--
-- Name: registros_cultos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.registros_cultos ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_cell_highlights; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_cell_highlights ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_cell_page_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_cell_page_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_giving_page_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_giving_page_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_home_banners; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_home_banners ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_media_highlights; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_media_highlights ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_pages; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_pages ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: site_ifc_studies; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.site_ifc_studies ENABLE ROW LEVEL SECURITY;

--
-- Name: spaces_eventos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.spaces_eventos ENABLE ROW LEVEL SECURITY;

--
-- Name: spaces_eventos spaces_eventos_temp_allow_all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY spaces_eventos_temp_allow_all ON public.spaces_eventos USING (true) WITH CHECK (true);


--
-- Name: spiritual_info; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.spiritual_info ENABLE ROW LEVEL SECURITY;

--
-- Name: talents; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.talents ENABLE ROW LEVEL SECURITY;

--
-- Name: tithers; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tithers ENABLE ROW LEVEL SECURITY;

--
-- Name: transactions; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;

--
-- Name: user_notes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.user_notes ENABLE ROW LEVEL SECURITY;

--
-- Name: user_roles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

--
-- Name: user_roles user_roles_admin_only; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY user_roles_admin_only ON public.user_roles TO authenticated USING (public.has_role(auth.uid(), 'admin'::public.app_role));


--
-- Name: user_roles user_roles_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY user_roles_select_own ON public.user_roles FOR SELECT TO authenticated USING ((auth.uid() = user_id));


--
-- Name: visitantes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.visitantes ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow public delete on esboco-sermao; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public delete on esboco-sermao" ON storage.objects FOR DELETE USING ((bucket_id = 'esboco-sermao'::text));


--
-- Name: objects Allow public insert on esboco-sermao; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public insert on esboco-sermao" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'esboco-sermao'::text));


--
-- Name: objects Allow public read on esboco-sermao; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public read on esboco-sermao" ON storage.objects FOR SELECT USING ((bucket_id = 'esboco-sermao'::text));


--
-- Name: objects Authenticated users can delete member photos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated users can delete member photos" ON storage.objects FOR DELETE TO authenticated USING ((bucket_id = 'member-photos'::text));


--
-- Name: objects Authenticated users can read member photos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated users can read member photos" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'member-photos'::text));


--
-- Name: objects Authenticated users can update member photos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated users can update member photos" ON storage.objects FOR UPDATE TO authenticated USING ((bucket_id = 'member-photos'::text)) WITH CHECK ((bucket_id = 'member-photos'::text));


--
-- Name: objects Authenticated users can upload member photos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated users can upload member photos" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'member-photos'::text));


--
-- Name: objects Avatares são públicos para leitura; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Avatares são públicos para leitura" ON storage.objects FOR SELECT USING ((bucket_id = 'avatars'::text));


--
-- Name: objects Imagens de eventos são públicas; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Imagens de eventos são públicas" ON storage.objects FOR SELECT USING ((bucket_id = 'event-images'::text));


--
-- Name: objects Managers can delete documentos bucket; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Managers can delete documentos bucket" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'documentos'::text) AND public.can_manage_documents()));


--
-- Name: objects Managers can read documentos bucket; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Managers can read documentos bucket" ON storage.objects FOR SELECT TO authenticated USING (((bucket_id = 'documentos'::text) AND public.can_manage_documents()));


--
-- Name: objects Managers can update documentos bucket; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Managers can update documentos bucket" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'documentos'::text) AND public.can_manage_documents())) WITH CHECK (((bucket_id = 'documentos'::text) AND public.can_manage_documents()));


--
-- Name: objects Managers can upload documentos bucket; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Managers can upload documentos bucket" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'documentos'::text) AND public.can_manage_documents()));


--
-- Name: objects Usuários autenticados podem atualizar documentos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem atualizar documentos" ON storage.objects FOR UPDATE USING (((bucket_id = 'documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários autenticados podem atualizar imagens; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem atualizar imagens" ON storage.objects FOR UPDATE USING (((bucket_id = 'event-images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários autenticados podem deletar documentos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem deletar documentos" ON storage.objects FOR DELETE USING (((bucket_id = 'documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários autenticados podem deletar imagens; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem deletar imagens" ON storage.objects FOR DELETE USING (((bucket_id = 'event-images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários autenticados podem fazer upload de documentos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem fazer upload de documentos" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários autenticados podem fazer upload de imagens; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem fazer upload de imagens" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'event-images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários autenticados podem ler documentos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários autenticados podem ler documentos" ON storage.objects FOR SELECT USING (((bucket_id = 'documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Usuários podem atualizar próprio avatar; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários podem atualizar próprio avatar" ON storage.objects FOR UPDATE USING (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Usuários podem deletar próprio avatar; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários podem deletar próprio avatar" ON storage.objects FOR DELETE USING (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: objects Usuários podem fazer upload do próprio avatar; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Usuários podem fazer upload do próprio avatar" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_namespaces; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.iceberg_namespaces ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_tables; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.iceberg_tables ENABLE ROW LEVEL SECURITY;

--
-- Name: objects media_assets_objects_delete; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY media_assets_objects_delete ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'media-assets'::text) AND public.app_storage_path_belongs_to_owner(name)));


--
-- Name: objects media_assets_objects_insert; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY media_assets_objects_insert ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'media-assets'::text) AND public.app_storage_path_belongs_to_owner(name)));


--
-- Name: objects media_assets_objects_read; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY media_assets_objects_read ON storage.objects FOR SELECT TO authenticated, anon USING ((bucket_id = 'media-assets'::text));


--
-- Name: objects media_assets_objects_update; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY media_assets_objects_update ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'media-assets'::text) AND public.app_storage_path_belongs_to_owner(name))) WITH CHECK (((bucket_id = 'media-assets'::text) AND public.app_storage_path_belongs_to_owner(name)));


--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime visitantes; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.visitantes;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--
