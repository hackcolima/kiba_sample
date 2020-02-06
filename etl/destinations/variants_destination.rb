require_relative '../../config/environment'

class VariantsDestination
  def write(row)
    Variant.create(row)
  end

  # an optional close method that will be called,
  # if present, at the end of the processing
  # (useful to tear down resources such as connections)
  # https://github.com/thbar/kiba/wiki/Implementing-ETL-destinations
  def close
  end
end
