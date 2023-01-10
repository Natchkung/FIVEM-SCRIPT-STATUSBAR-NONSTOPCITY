$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        var health = event.data.health;
        var armor = event.data.armor;
        var hunger = event.data.hunger;
        // var thirst = event.data.thirst;
        var dirty = event.data.dirty;
        var sleep = event.data.sleep;
        var stamina = event.data.stamina;
        var id = event.data.id;
        var dive = event.data.dive;

        let dt = new Date();

        if (parseInt(dt.getHours()) < 10) { var hour = "0" + dt.getHours(); } else { var hour = dt.getHours(); }
        if (parseInt(dt.getMinutes()) < 10) { var minute = "0" + dt.getMinutes(); } else { var minute = dt.getMinutes(); }
        if (parseInt(dt.getSeconds()) < 10) { var second = "0" + dt.getSeconds(); } else { var second = dt.getSeconds(); }
        var datatime_format_TH = hour + ":" + minute + ":" + second;

        $("#timestamp").html(datatime_format_TH).show();

        var name = event.data.name;
        $("#username").html(name).show();


        $("#hpreal").css("width", health + "%");
        $("#hugreal").css("width", hunger + "%");
        // $("#wa").css("width", thirst + "%");
        $("#strreal").css("width", stamina + "%");
        $("#divreal").css("width", dive + "%");
        $("#showerreal").css("width", dirty + "%");
        $("#sleepreal").css("width", sleep + "%");
        $("#amrreal").css("width", armor + "%");

        $("#tid").html(Math.round(id));
        $("#Hp").html(Math.round(health) + "%");

    })
})