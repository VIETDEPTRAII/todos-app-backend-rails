# frozen_string_literal: true

module Api
  module V1
    # Todos controller
    class TodosController < ApplicationController
      before_action :set_todo, only: %i[show update destroy]

      # GET /todos
      # GET /todos.json
      def index
        @todos = Todo.all

        render json: @todos
      end

      # GET /todos/1
      # GET /todos/1.json
      def show
        render json: @todo
      end

      # POST /todos
      # POST /todos.json
      def create
        @todo = Todo.new(todo_params)

        if @todo.save
          render json: @todo
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /todos/1
      # PATCH/PUT /todos/1.json
      def update
        if @todo.update(todo_params)
          render json: @todo
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /todos/1
      # DELETE /todos/1.json
      def destroy
        @todo.destroy
      end

      private

      def set_todo
        @todo = Todo.find(params[:id])
      end

      def todo_params
        params.require(:todo).permit(:title, :completed)
      end
    end
  end
end
