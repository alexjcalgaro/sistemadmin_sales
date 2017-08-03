RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


  ##Mostra os campos os campos que são importante na tela
  #Model venda.
  config.model Sale do
    #Campos para cadastro
    create do
      field :client
      field :sale_date
      field :discount
      field :notes
      field :product_quantities

      #pega o id do user logado para não precisar ficar selecionando ele mesmo.
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    #Campos para edição
    edit do
      field :client
      field :sale_date
      field :discount
      field :notes
      field :product_quantities

      #pega o id do user logado para não precisar ficar selecionando ele mesmo.
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  #Model Cliente
  config.model Client do
    #Campos para o cadastro
    create do
      field :name
      field :company_name
      field :document
      field :email
      field :phone
      field :notes
      field :status
      field :address

      #pega o id do user logado para não precisar ficar selecionando ele mesmo.
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    #Campos para a Ediação
    edit do
      field :name
      field :company_name
      field :document
      field :email
      field :phone
      field :notes
      field :status
      field :address

      #pega o id do user logado para não precisar ficar selecionando ele mesmo.
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    #Campos para a listagem
    list do
      field :name
      field :company_name
      field :document
      field :email
      field :phone
      field :notes
      field :status
      field :address
    end
  end

  #Model venda.
  config.model Product do
    #Campos para cadastro
    create do
      field :name
      field :description
      field :status
      field :price
      field :photo
    end

    edit do
      field :name
      field :description
      field :status
      field :price
      field :photo
    end
  end

  #Tira do menu lateral o menu Quntidade de Produto pois a mesma n faz sentido
  #nessa menu, apenas na Venda
  config.model ProductQuantity do
    visible false
  end

  #Tira do menu lateral o menu endereço pois o mesmo n faz sentido
  #nessa menu, apenas no cadastro
  config.model Address do
    visible false
  end

  #Mostra o menu apenas quando estiver lançando uma venda e mostrando apenas
  #os campos que fazem sentidos.
  config.model ProductQuantity do
    edit do
      field :product
      field :quantity

      #pega o id do user logado para não precisar ficar selecionando ele mesmo.
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
