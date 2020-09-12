# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Master
  self.abstract_class = true
end
