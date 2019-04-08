Rails.application.routes.draw do
  get '/' => 'patient_summaries#show', as: :patient_summaries_show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
