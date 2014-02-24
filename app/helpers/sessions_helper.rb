module SessionsHelper
  def login_with_bitbucket_path
    '/auth/bitbucket'
  end

  def login_with_github_path
    '/auth/github'
  end

  def login_with_google_path
    '/auth/google'
  end
end
