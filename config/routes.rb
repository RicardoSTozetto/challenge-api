Rails.application.routes.draw do
  resources :eventos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Rota para consulta ao próximo lançamento
  get 'proximo', to: "eventos#next"

  # Rota para consulta ao último lançamento
  get 'ultimo', to: "eventos#latest"

  # Rota para consulta aos próximos lançamentos
  get 'proximos', to: "eventos#upcoming"

  # Rota para consulta aos lançamentos passados
  get 'passados', to: "eventos#past"

end
