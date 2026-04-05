defmodule DaisyUIComponents.TextareaTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Textarea

  alias DaisyUIComponents.Utils

  test "simple textarea with slot" do
    assigns = %{}

    ~H"""
    <.textarea placeholder="textarea placeholder">
      This is a textarea
    </.textarea>
    """
    |> parse_component()
    |> assert_component("textarea")
    |> assert_class("textarea")
    |> assert_attribute("placeholder", "textarea placeholder")
    |> assert_text("This is a textarea")
  end

  test "textarea colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.textarea color={@color} />
      """
      |> parse_component()
      |> assert_component("textarea")
      |> assert_class("textarea textarea-#{color}")
    end
  end

  test "textarea sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.textarea size={@size} />
      """
      |> parse_component()
      |> assert_component("textarea")
      |> assert_class("textarea textarea-#{size}")
    end
  end

  test "textarea boolean assigns" do
    for boolean_assign <- ~w(ghost)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.textarea {assigns} />
      """
      |> parse_component()
      |> assert_component("textarea")
      |> assert_class("textarea textarea-#{to_string(boolean_assign)}")
    end
  end

  test "textarea forwards modern attributes" do
    assigns = %{}

    ~H"""
    <.textarea
      name="bio"
      form="profile-form"
      rows="4"
      cols="30"
      wrap="soft"
      minlength="10"
      maxlength="200"
      inputmode="text"
      enterkeyhint="go"
      autocomplete="on"
      placeholder="Tell us about yourself"
      aria-label="Bio"
    >Hi</.textarea>
    """
    |> parse_component()
    |> assert_component("textarea")
    |> assert_attribute("name", "bio")
    |> assert_attribute("form", "profile-form")
    |> assert_attribute("rows", "4")
    |> assert_attribute("cols", "30")
    |> assert_attribute("wrap", "soft")
    |> assert_attribute("minlength", "10")
    |> assert_attribute("maxlength", "200")
    |> assert_attribute("inputmode", "text")
    |> assert_attribute("enterkeyhint", "go")
    |> assert_attribute("autocomplete", "on")
    |> assert_attribute("placeholder", "Tell us about yourself")
    |> assert_attribute("aria-label", "Bio")
  end
end
