defmodule DaisyUIComponents.TextInputTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.TextInput

  alias DaisyUIComponents.Utils

  test "text input" do
    assigns = %{}

    ~H"""
    <.text_input placeholder="text input placeholder" />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_class("input")
    |> assert_attribute("type", "text")
    |> assert_attribute("placeholder", "text input placeholder")
  end

  test "text input colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.text_input color={@color} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("input input-#{color}")
    end
  end

  test "text input sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.text_input size={@size} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("input input-#{size}")
    end
  end

  test "text input boolean assigns" do
    for boolean_assign <- ~w(ghost)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.text_input {assigns} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("input input-#{to_string(boolean_assign)}")
    end
  end

  test "text input forwards modern attributes" do
    assigns = %{}

    ~H"""
    <.text_input
      name="username"
      form="user-form"
      inputmode="email"
      enterkeyhint="done"
      minlength="3"
      maxlength="20"
      pattern="[a-z]+"
      autocomplete="username"
      placeholder="user"
      aria-label="Username"
    />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_attribute("name", "username")
    |> assert_attribute("form", "user-form")
    |> assert_attribute("inputmode", "email")
    |> assert_attribute("enterkeyhint", "done")
    |> assert_attribute("minlength", "3")
    |> assert_attribute("maxlength", "20")
    |> assert_attribute("pattern", "[a-z]+")
    |> assert_attribute("autocomplete", "username")
    |> assert_attribute("placeholder", "user")
    |> assert_attribute("aria-label", "Username")
  end
end
