class CurrenciesController < ApplicationController
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

  def exchange_currency

    #@raw_data =  open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
    #@parsed_data = JSON.parse(@raw_data)
    #@symbols_hash = @parsed_data.fetch("symbols")

    #@array_of_symbols = @symbols_hash.keys

    @raw_data = open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
    @parsed_data = JSON.parse(@raw_data)
    @info_hash = @parsed_data.fetch("info")
    @info_rate = @info_hash["rate"]

    @starting_currency = params.fetch("from_currency")
    @ending_currency = params.fetch("to_currency")

    render({ :template => "currency_templates/step_three.html.erb"})

  end

  end

  