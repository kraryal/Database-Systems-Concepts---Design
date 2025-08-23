
Data = [{1: "Email address must be unique, your input email is not unique"},
        {2: "Invalid Postal code"},
        {3: "Invalid household info provided, please return to the main menu to create new household."},
        {4: "Invalid household info provided, please return to the main menu to add power."},
        {5: "Invalid household info provided, please return to the main menu to add appliances.",} ]

def validation_check(key_value):
    message = Data[key_value]
    return render_template('error_messages.html', message=message)

