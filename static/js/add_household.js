    document.addEventListener('DOMContentLoaded', function() {
        var form = document.getElementById('housholdForm');

        form.addEventListener('submit', function(event) {
            event.preventDefault();
            var input1 = document.getElementById('thermoheat');
            var input2 = document.getElementById('thermocool');
            var checkbox1 = document.getElementById('noHeat');
            var checkbox2 = document.getElementById('noCooling');
            if ((input1.value === '' && !checkbox1.checked) || (input2.value === '' && !checkbox2.checked)) {
                alert('Please provide cooling and heating settings or select the appropriate checkbox if there is no heating and/or cooling');
            } else if ((input1.value != '' && checkbox1.checked) || (input2.value !== '' && checkbox2.checked)) {
                alert("Invalid Entry, please check heating and cooling information and retry again")
            }
            else {
                form.submit();
            }
        });
    });