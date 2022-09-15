# frozen_string_literal: true

module Admins
  class AppConfigsController < BaseController
    before_action :app_config
    load_and_authorize_resource

    def update
      update_diapers_calculator
    end

    private

    def app_config
      @app_config = AppConfig.instance
    end

    def diapers_calculator_params
      params.permit(%i[first_amount first_price second_amount second_price
                       third_amount third_price fourth_amount fourth_price
                       fifth_amount fifth_price sixth_amount sixth_price
                       seventh_amount seventh_price
                       price_category_budgetary_first_period
                       price_category_premium_first_period
                       price_category_budgetary_second_period
                       price_category_premium_second_period
                       price_category_budgetary_third_period
                       price_category_premium_third_period
                       price_category_budgetary_fourth_period
                       price_category_premium_fourth_period
                       price_category_budgetary_fifth_period
                       price_category_premium_fifth_period
                       price_category_budgetary_sixth_period
                       price_category_premium_sixth_period
                       price_category_budgetary_seventh_period
                       price_category_premium_seventh_period])
    end

    def update_diapers_calculator
      @app_config.diapers_calculator = {
        (1..3) => {
          amount: params[:first_amount],
          price: params[:first_price],
          budgetary: params[:price_category_budgetary_first_period],
          premium: params[:price_category_premium_first_period]
        },
        (4..6) => {
          amount: params[:second_amount],
          price: params[:second_price],
          budgetary: params[:price_category_budgetary_second_period],
          premium: params[:price_category_premium_second_period]
        },
        (7..9) => {
          amount: params[:third_amount],
          price: params[:third_price],
          budgetary: params[:price_category_budgetary_third_period],
          premium: params[:price_category_premium_third_period]
        },
        (10..12) => {
          amount: params[:fourth_amount],
          price: params[:fourth_price],
          budgetary: params[:price_category_budgetary_fourth_period],
          premium: params[:price_category_premium_fourth_period]
        },
        (13..18) => {
          amount: params[:fifth_amount],
          price: params[:fifth_price],
          budgetary: params[:price_category_budgetary_fifth_period],
          premium: params[:price_category_premium_fifth_period]
        },
        (19..24) => {
          amount: params[:sixth_amount],
          price: params[:sixth_price],
          budgetary: params[:price_category_budgetary_sixth_period],
          premium: params[:price_category_premium_sixth_period]
        },
        (25..30) => {
          amount: params[:seventh_amount],
          price: params[:seventh_price],
          budgetary: params[:price_category_budgetary_seventh_period],
          premium: params[:price_category_premium_seventh_period]
        }
      }
      @app_config.save
    end
  end
end
