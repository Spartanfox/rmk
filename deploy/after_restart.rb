on_app_servers do
  sudo "monit restart all -g rmk_sidekiq"
end
