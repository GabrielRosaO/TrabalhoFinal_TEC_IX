/**
* Name: TesteComDadosl
* Based on the internal empty template. 
* Author: Rosa
* Tags: 
*/


model TestePiramideGPT

/* Insert your model definition here */


global {
	
	bool end_simulation <- false;
	 
    init {
	create people number: 100; 
    }
    
    reflex finish_simulation when: end_simulation{
    	do pause;
    }
    
}

species people {
    int age <- rnd(5, 100);
    
    reflex older {
		age <- age + 1;
    }
    
}

experiment my_experiment type: gui {
    float minimum_cycle_duration <- 0.1;
    
    output {
	display "chart age" type:2d{
	    chart "age" type: box_whisker series_label_position:xaxis {
	    
		data "age"
		    value: [50,50,
		   	gauss(25,2.0),50,
		   	0,50]
		   	color: #green
			accumulate_values: true;
	 	
			data "age2"
		    	value: [50,50,
		   		50, gauss(75,2.0),
		   		50, 100]
		   		color: #blue
				accumulate_values: true;
				}
			}
	  	}
    }

