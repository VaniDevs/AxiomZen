INSERT INTO auth.users VALUES ('demo@example.org', 'demo');

CREATE TABLE IF NOT EXISTS agencies (
  id SERIAL PRIMARY KEY,
  image JSONB,
  email TEXT,
  phone TEXT,
  address TEXT,
  website TEXT,
  agency TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS clients (
  id SERIAL PRIMARY KEY,
  lname TEXT NOT NULL,
  fname TEXT NOT NULL,
  email TEXT,
  phone TEXT,
  custom_info JSONB,
  agent TEXT,
  image JSONB,
  approval_status TEXT DEFAULT 'pending',
  agency_id INTEGER,
  FOREIGN KEY (agency_id) REFERENCES agencies (id)
);

CREATE TABLE IF NOT EXISTS item_types (
  id SERIAL PRIMARY KEY,
  item_category TEXT NOT NULL,
  item_labels JSONB,
  description TEXT,
  requirements JSONB,
  exp_time_months INTEGER,
  image JSONB
);

CREATE TABLE shopping_list_items (
  id SERIAL PRIMARY KEY, 
  item_labels JSONB, 
  item_priority INTEGER,
  list_status TEXT DEFAULT 'awaiting',
  date_requested DATE DEFAULT CURRENT_DATE,
  client_id INTEGER,
  item_type INTEGER,
  FOREIGN KEY (client_id) REFERENCES clients (id),
  FOREIGN KEY (item_type) REFERENCES item_types(id)
);

CREATE TABLE IF NOT EXISTS drop_locations(
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS item_inventory (
  id SERIAL PRIMARY KEY,
  item_type INTEGER,
  item_labels JSONB,
  item_status TEXT DEFAULT 'in-stock',
  image JSONB,
  donor_email TEXT,
  location_id INTEGER,
  added_by TEXT,
  FOREIGN KEY (item_type) REFERENCES item_types(id),
  FOREIGN KEY (location_id) REFERENCES drop_locations(id)
);

CREATE TABLE IF NOT EXISTS item_match(
  id SERIAL PRIMARY KEY,
  msg TEXT,
  shared boolean,
  updated_at DATE DEFAULT CURRENT_DATE,
  item_inventory_id INTEGER,
  shopping_list_item_id INTEGER,
  FOREIGN KEY (shopping_list_item_id) REFERENCES shopping_list_items(id),
  FOREIGN KEY (item_inventory_id) REFERENCES item_inventory(id)
);

CREATE TABLE IF NOT EXISTS referrals_form_inputs (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  optional BOOLEAN DEFAULT false
);

