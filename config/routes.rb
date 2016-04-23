Rails.application.routes.draw do
  resources :players, :path => "/jugadores"
  resources :games, :path => "/partidas"
end
