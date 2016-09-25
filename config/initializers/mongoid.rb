module BSON
  class ObjectId
    def to_json(*args)
      to_s.to_json
    end

    def as_json(*args)
      to_s.as_json
    end
  end
end

module Mongoid
  module Document
    def serializable_hash(options = nil)
      hash = super(options)
      hash['id'] = hash.delete('_id') if(hash.has_key?('_id'))
      hash
    end
  end
end
