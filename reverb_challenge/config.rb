# Constants
DATA_PATH = './csv/person_records.csv'

# Require files
require './seed'
require './reader'
require './app/models/person'
require './app/views/command_line_view'
require './app/controllers/people_controller'
require './app/controllers/api/people_controller'

# Require Ruby modules
require 'csv'