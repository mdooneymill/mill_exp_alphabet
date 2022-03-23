

// Image 
PImage letter;
// Space between shapes
float spacing = 12;


void setup() 
{

    // sketch size and bg color    
    size( 1024, 1024 );
    background( 12 );

    // disable stroke
    noStroke();

    // load the image and resize
    letter = loadImage( "a.jpg" );
    letter.resize( width, height );

    // scan the image
    scanImage();

    // and save it
    saveFrame( "a.png" );

}


// 'Scan' the image
// Loop over the pixels drawing an ellipse where the color value is less than 100
void scanImage()
{

    // How many dots can we possibly place on each axis?
    int xCount = floor( width / spacing );
    int yCount = floor( height / spacing );

    // store the total
    int totalPoints = xCount * yCount;

    // then for each of those points
    for( int i = 0; i < totalPoints; i++ )
    {

        // calculate the x and y indices
        int x = i % yCount;
        int y = i / yCount;

        // convert to a position
        float xPos = x * spacing;
        float yPos = y * spacing;

        // get the pixel value at that position
        color c = letter.get( floor( xPos ), floor( yPos ) );

        // if the sum of all the color values is less than a given threshold.... (100 here)
        if( red( c ) + green( c ) + blue( c ) < 100 )
        {
            
            // random val between 100 & 200
            float val = 100 + random( 100 );
            
            // set as fill color
            fill( val );

            // drawn an ellipse at the position and
            // use val/10 as size
            ellipse( xPos, yPos, val / 10, val / 10 );
            // and another in the middle slightly brighter and smaller
            fill( 0 );
            ellipse( xPos, yPos, val / 20, val / 20 );

        }

    }

}
