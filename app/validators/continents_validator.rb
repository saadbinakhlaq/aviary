class ContinentsValidator < ActiveModel::Validator
  def validate(record)
    if record.continents.any? { |continent| continent.blank? }
      record.errors[:continents] << 'need non blank continents values'
    end
  end
end
