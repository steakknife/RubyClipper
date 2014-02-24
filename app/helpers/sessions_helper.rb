module SessionsHelper
  def login_with_bitbucket_path
    '/auth/bitbucket'
  end

  def login_with_github_path
    '/auth/github'
  end

  def login_with_google_path
    return '/#google_doesnt_work_in_dev' if Rails.env.development? || Rails.env.test?
    '/auth/google'
  end

  def login_with_twitter_path
    '/auth/twitter'
  end

  def login_with_facebook_path
    '/auth/facebook'
  end
end
