class Token

  def self.get_tokens
    @tokens = [ ENV["INTERCOM_ACCESS_TOKEN_1"], ENV["INTERCOM_ACCESS_TOKEN_2"] ]
  end

end
