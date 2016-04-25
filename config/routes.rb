Rails.application.routes.draw do
  resources :players, :path => "/jugadores", :path_names => { :new => "nuevo", :edit => "editar" }
  resources :games, :path => "/partidas", :path_names => { :new => "nuevo", :edit => "editar" }
  root to: "players#index"
end
