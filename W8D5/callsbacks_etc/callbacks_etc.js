// Simple Timeout

window.setTimeout(callsAlert, 5000)

function callsAlert() {
    alert('HAMMERTIME');
}

// Timeout plus closure

function hammerTime(time) {
    window.setTimeout(newAlert, time);
    function newAlert() {
        alert(`${time} is hammerTime`)
    }
}


