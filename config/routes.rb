Rails.application.routes.draw do
  resources :players, :path => "/jugadores", :path_names => { :new => "nuevo", :edit => "editar" }
  resources :games, :path => "/partidas", :only => [:index, :show]
  resources :forecasts, :path => "/pronostico", :only => [:index]
  root to: "games#index"
end
