var mouseOver = false;
var selectedIdentity = null;
var selectedIdentityType = null;
var selectedJob = null;
var selectedJobId = null;

function OpenCityHall() {
    $(".container").fadeIn(150);
}

function CloseCityHall() {
    $(".container").fadeOut(150, function(){
        ResetPages();
    });
    $.post('https://qb-cityhall/close');

    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");
}

function GenerateJobs(data) {
    const element = document.querySelector(".job-page-blocks");
    data.jobs.forEach(function(item) {
        element.innerHTML += '<div class="job-page-block" data-job=' + item.job + '><p>' + item.label + '</p></div>';
    });
}

function ResetPages() {
    $(".cityhall-option-blocks").show();
    $(".cityhall-identity-page").hide();
    $(".cityhall-job-page").hide();
}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "ready":
                GenerateJobs(event.data);
                break;
            case "open":
                OpenCityHall();
                break;
            case "close":
                CloseCityHall();
                break;
        }
    })
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            CloseCityHall();
            break;
    }
});

$('.cityhall-option-block').click(function(e){
    e.preventDefault();

    var blockPage = $(this).data('page');

    $(".cityhall-option-blocks").fadeOut(100, function(){
        $(".cityhall-"+blockPage+"-page").fadeIn(100);
    });

    if (blockPage == "identity") {
        $(".identity-page-blocks").html("");
        $(".identity-page-blocks").html('<div class="identity-page-block" data-type="id_card"><p>ID Card</p></div>');

        $.post('https://qb-cityhall/requestLicenses', JSON.stringify({}), function(licenses){
            $.each(licenses, function(i, license){
                var elem = '<div class="identity-page-block" data-type="'+license.idType+'"><p>'+license.label+'</p></div>';
                $(".identity-page-blocks").append(elem);
            });
        });
    }
});

$(document).on("click", ".identity-page-block", function(e){
    e.preventDefault();

    var idType = $(this).data('type');

    selectedIdentityType = idType;

    if (selectedIdentity == null) {
        $(this).addClass("identity-selected");
        $(".hover-description").fadeIn(10);
        selectedIdentity = this;
        if (idType == "id_card") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Buy $50</p>")
        } else if (idType == "driver_license") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Buy $50</p>")
        } else if (idType == "weaponlicense") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Buy $50</p>")
        }
    } else if (selectedIdentity == this) {
        $(this).removeClass("identity-selected");
        selectedIdentity = null;
        $(".request-identity-button").fadeOut(100);
    } else {
        $(selectedIdentity).removeClass("identity-selected");
        $(this).addClass("identity-selected");
        selectedIdentity = this;
        if (idType == "id_card") {
            $(".request-identity-button").html("<p>Buy</p>")
        } else if (idType == "driver_license") {
            $(".request-identity-button").html("<p>Buy</p>")
        } else if (idType == "weaponlicense") {
            $(".request-identity-button").html("<p>Buy</p>")
        }
    }
});

$(".request-identity-button").click(function(e){
    e.preventDefault();

    $.post('https://qb-cityhall/requestId', JSON.stringify({
        idType: selectedIdentityType
    }))

    ResetPages();
});

$(document).on("click", ".job-page-block", function(e){
    e.preventDefault();

    var job = $(this).data('job');

    selectedJobId = job;

    if (selectedJob == null) {
        $(this).addClass("job-selected");
        selectedJob = this;
        $(".apply-job-button").fadeIn(100);
    } else if (selectedJob == this) {
        $(this).removeClass("job-selected");
        selectedJob = null;
        $(".apply-job-button").fadeOut(100);
    } else {
        $(selectedJob).removeClass("job-selected");
        $(this).addClass("job-selected");
        selectedJob = this;
    }
});

$(document).on('click', '.apply-job-button', function(e){
    e.preventDefault();

    $.post('https://qb-cityhall/applyJob', JSON.stringify({
        job: selectedJobId
    }))

    ResetPages();
});

$(document).on('click', '.back-to-main', function(e){
    e.preventDefault();

    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");

    ResetPages();
});
