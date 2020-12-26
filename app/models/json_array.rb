class JsonArray
  def self.load(ar_str)
    if ar_str.blank?
      Array.new
    else
      Oj.load(ar_str)
    end
  end

  def self.dump(ar_data)
    Oj.dump(ar_data)
  end
end