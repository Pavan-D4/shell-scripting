#!/bin/bash

# Initialize variables to store user selections and total price
declare -A items
declare -A prices
total_price=0

# Define the main items and their prices
items["1"]="Idly"
items["2"]="Dosa"
items["3"]="Fried-rice"
items["4"]="Poori"
items["5"]="Vada"
items["6"]="Chapathi"
items["7"]="Exit"

# Define prices for each item
prices["Idly"]=10
prices["Dosa"]=30
prices["Fried-rice"]=60
prices["Poori"]=20
prices["Vada"]=10
prices["Chapathi"]=25

# Define sub-options for each item
declare -A sub_items
sub_items["Idly"]="1) Rava Idly\n2) Normal Idly"
sub_items["Dosa"]="1) Masala Dosa\n2) Plain Dosa"
sub_items["Fried-rice"]="1) Veg Fried-rice\n2) Egg Fried-rice"
sub_items["Poori"]="1) Masala Poori\n2) Simple Poori"
sub_items["Vada"]="1) Medu Vada\n2) Sambar Vada"
sub_items["Chapathi"]="1) Chapathi with Curry\n2) Chapathi with Curd"

# Function to display the main menu
display_menu() {
    echo "Items:"
    for key in "${!items[@]}"; do
        echo "$key. ${items[$key]} - ${prices[${items[$key]}]} Rs"
    done
    echo ""
    echo "Please select an option (1-7):"
}

# Function to display sub options for a selected item
select_sub_item() {
    local selected_item=$1
    echo "Select sub-option for $selected_item:"
    echo -e "${sub_items[$selected_item]}"
    read -p "Enter your choice (1/2): " sub_choice
    if [[ "$sub_choice" -eq 1 ]]; then
        echo "$selected_item with Option 1 selected"
    elif [[ "$sub_choice" -eq 2 ]]; then
        echo "$selected_item with Option 2 selected"
    else
        echo "Invalid choice"
    fi
}

# Function to get the number of plates
get_quantity() {
    local selected_item=$1
    read -p "How many plates of $selected_item do you want? " quantity
    return $quantity
}

# Store user selections
order=()

# Main loop to handle the menu and ordering process
while true; do
    display_menu
    read -p "Select item: " choice
    
    if [[ "$choice" -eq 7 ]]; then
        # Exit the loop when the user selects Exit
        echo "You selected Exit"
        break
    elif [[ -n "${items[$choice]}" ]]; then
        selected_item="${items[$choice]}"
        
        # Show sub options for the selected item
        select_sub_item "$selected_item"
        
        # Ask for the number of plates
        get_quantity "$selected_item"
        quantity=$?
        
        # Add the selected item and quantity to the order list
        order+=("$quantity plate(s) of $selected_item")
        total_price=$((total_price + quantity * prices[$selected_item]))
    else
        echo "Invalid selection, please try again."
    fi
done

# Display the order summary
echo ""
echo "Order Summary:"
for item in "${order[@]}"; do
    echo "$item"
done
echo "Total Price: Rs $total_price"

# Ask for confirmation
read -p "Do you want to confirm your order? (ok/confirm to confirm): " confirmation

if [[ "$confirmation" == "ok" || "$confirmation" == "confirm" ]]; then
    echo "Order successful!"
else
    echo "Order not confirmed. Waiting for 60 seconds..."
    sleep 60
fi

