Step to reproduce the redex issue:

1. Install docker on your machine
2. Build the container
    ```
    git clone https://github.com/wisechengyi/redex_repro.git
    cd redex_repro/ubuntu
    docker build . -t redex:repro # redex binary will be at /redex/redex
    ```
3. Start the container
    ```
    docker run -itd redex:repro # will output a <container id>
    docker exec -it <container id> bash
    ```
4. Check out the repro repo again in the container
    ```
    git clone https://github.com/wisechengyi/redex_repro.git
    cd redex_repro/ubuntu
    
    /redex/redex release.apk -o x.apk -c repro.config `find proguard_files/ -name '*.txt' | sed 's/^/ -P /g'` 
    ```