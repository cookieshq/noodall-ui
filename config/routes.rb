Noodall::Application.routes.draw do
  root :to => "noodall/nodes#show", :permalink => ['home']
  namespace 'noodall/admin', :as => 'noodall_admin', :path => 'admin' do
    resources :nodes do
      resources :nodes
      member do 
        get :change_template
        get :move_up
        get :move_down
        post :preview
      end
      collection do
        get :tree
      end
    end
  
    resources :assets do
      collection do
        get :videos
        get :documents
        post :plupload
        get :pending
        get :tags
      end
      member do
        get :add
      end
    end
    match 'assets/:asset_type/tags' => 'assets#tags', :as => :asset_tags
    resources :groups
  end
  get "search" => "noodall/nodes#search", :as => :noodall_search
  get "sitemap" => "noodall/nodes#sitemap", :as => :noodall_site_map
  get "*permalink(.:format)" =>  'noodall/nodes#show', :as => :node_permalink
end
