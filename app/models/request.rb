class Request
  include Mongoid::Document
  include Mongoid::Timestamps

  field :trap_id, type: String
  field :data, type: Object
end
