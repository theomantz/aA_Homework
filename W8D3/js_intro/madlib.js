function madLib(verb, adjective, noun) {

    up_verb = verb.toUpperCase();
    up_adjective = adjective.toUpperCase();
    up_noun = noun.toUpperCase();
    
    function makemadLib() {
        console.log(`We shall ${up_verb} the ${up_adjective} ${up_noun}`);
    }
    makemadLib();
}

madLib('make', 'best', 'guac')