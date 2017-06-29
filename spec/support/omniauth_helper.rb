OmniAuth.config.test_mode = true

def set_auth_mock(provider: nil, nickname: nil, name: nil, icon_url: nil, uid: nil)
  OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new({
    provider: provider,
    uid: uid,
    info: {
      nickname: nickname,
      name: name,
      image: icon_url
    }
  })
end

def unset_auth_mock(provider)
  OmniAuth.config.mock_auth[provider] = nil
end
