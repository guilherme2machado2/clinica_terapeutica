-- V1__init_schema.sql
-- Requer: PostgreSQL
-- Habilita extensão para UUID (ajuste se preferir pgcrypto)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tipo enum para status de appointment
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'appointment_status') THEN
    CREATE TYPE appointment_status AS ENUM ('scheduled','confirmed','completed','canceled');
  END IF;
END$$;

-- Tabela patients
CREATE TABLE IF NOT EXISTS patients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  full_name VARCHAR(150) NOT NULL,
  phone_number VARCHAR(30),
  email VARCHAR(120),
  birth_date DATE,
  gender VARCHAR(20),
  intake_reason TEXT,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela appointments
CREATE TABLE IF NOT EXISTS appointments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  patient_id UUID NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  date_time_start TIMESTAMP WITH TIME ZONE NOT NULL,
  date_time_end TIMESTAMP WITH TIME ZONE,
  status appointment_status NOT NULL DEFAULT 'scheduled',
  google_event_id VARCHAR(200),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela automation_logs
CREATE TABLE IF NOT EXISTS automation_logs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  appointment_id UUID REFERENCES appointments(id) ON DELETE SET NULL,
  patient_id UUID REFERENCES patients(id) ON DELETE SET NULL,
  automation_type VARCHAR(50) NOT NULL, -- e.g., reminder, confirmation, post_session
  message_sent TEXT,
  whatsapp_message_id VARCHAR(150),
  status VARCHAR(20), -- sent, delivered, read, error
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela forms_leads (opcional)
CREATE TABLE IF NOT EXISTS forms_leads (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  google_forms_id VARCHAR(150),
  json_payload JSONB,
  processed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Triggers to update updated_at on change
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS set_timestamp_patients ON patients;
CREATE TRIGGER set_timestamp_patients
BEFORE UPDATE ON patients
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

DROP TRIGGER IF EXISTS set_timestamp_appointments ON appointments;
CREATE TRIGGER set_timestamp_appointments
BEFORE UPDATE ON appointments
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();
