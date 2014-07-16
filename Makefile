all:
	./run.sh

png:
	python show.py

clean:
	rm -r output_detection
    rm -r output_segmentation		
    rm -r output_reconstruction	
