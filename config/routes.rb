WorkstationManager::Application.routes.draw do
 
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  #� ������������� ������� ���������, �� ����� ��������. ������� ���� ���
  resources :partners, only: [:create, :destroy, :edit, :show, :update]
  #����� �� �������. ��������� ����� ��������� ����������
  resources :equipment
  resources :inboxes do
	resources :partners
	resources :equipments
  end
  	resources :equipments
  resources :outboxes
  resources :static_pages
  resources :messages
  root to: 'static_pages#home'

  match '/partners', to: 'partners#index_partners'
  match '/addpartner', to:'partners#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/home',    to: 'static_pages#home'
  match '/help',    to: 'static_pages#help'
  match '/contact', to: 'static_pages#contact'
  match '/about',   to: 'static_pages#about'
  match '/signup',  to: 'users#new'
 
end
