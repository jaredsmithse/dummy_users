helpers do
  def create_user(info)
    info[:salt] = SecureRandom.base64(6)
    info[:password_hash] = Digest::MD5.hexdigest(info[:password_hash] + info[:salt])
    info
  end
end