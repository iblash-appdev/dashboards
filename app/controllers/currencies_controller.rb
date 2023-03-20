class CurrenciesController < ApplicationController
  def homepage
    render({ :template => "currency_templates/home.html.erb"})
  end
  def first_currency

    @raw_data =  open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency

    @raw_data =  open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    # params are
    #Parameters: {"from_currency"=>"ARS"}

    @from_symbol = params.fetch("from_currency")

    render({ :template => "currency_templates/step_two.html.erb" }) 

  end

  def third_currency

    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")
    

    @rate_data = open("https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_symbol}").read

    @parsed_data = JSON.parse(@rate_data)
    @result=@parsed_data.fetch("info").fetch("rate")

  render({ :template => "currency_templates/step_three.html.erb"})

  end

  end

  