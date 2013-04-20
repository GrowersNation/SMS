module TextMessageHelper
  def format_sample(sample)
    sample.attributes.map{|k,v| "#{k}: #{v}" unless v.blank? || k =~ /updated_at|created_at/}.compact.join(' ')
  end
end
