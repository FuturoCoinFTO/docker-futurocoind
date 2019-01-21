Building
========

A recommended security practice is to add an additional unprivileged user to run the daemon as on the host. For example, as a privileged user, run this on the host:

        $ useradd futuro

To build an image which uses this unprivileged user's id and group id, run:

        $ docker build -t futurocoinfto/futurocoind --build-arg USER_ID=$( id -u futuro ) --build-arg GROUP_ID=$( id -g futuro ) .

Now, when the container is run with the default options, the futurocoind process will only have the privileges of the futuro user on the host machine. This is especially important for a process such as futurocoind which runs as a network service exposed to the internet.
