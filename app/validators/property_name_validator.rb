class PropertyNameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.blank?
      record.errors[attribute] << "should start with a lowercase letter" unless value.length >= 3
      record.errors[attribute] << "should start with a lowercase letter" unless value.length <= 30
      record.errors[attribute] << "should start with a lowercase letter" unless value[0] =~ /[a-z]/
      record.errors[attribute] << "should only contain lowercase letters, numbers, and underscores" unless value =~ /\A[a-z0-9_]*\z/
      record.errors[attribute] << "contains illegal characters" unless value.ascii_only?
    end
  end
end
