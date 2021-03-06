module Types
  class UserSetting < Types::BaseObject
    description "A coin from the portfolio of a user"

    field :id, ID, null: false

    field :quantity, Float, null: false
    field :weather, Boolean, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::User, null: false
    field :base_currency, Types::BaseCurrency, null: false
    field :primary_market_coin, Types::MarketCoin, null: false
  end
end
