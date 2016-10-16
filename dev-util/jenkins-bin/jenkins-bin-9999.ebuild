inherit java-pkg-2 user

DESCRIPTION="Extensible continuous integration server"
HOMEPAGE="http://jenkins-ci.org/"
LICENSE="MIT"
SRC_URI="http://mirrors.jenkins-ci.org/war/latest/jenkins.war"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-fonts/dejavu"
RDEPEND="${DEPEND}
        >=virtual/jdk-1.5"

pkg_setup() {
    enewgroup jenkins
    enewuser jenkins -1 /bin/bash /var/lib/jenkins jenkins
}

src_install() {
    keepdir /var/run/jenkins /var/log/jenkins
    keepdir /var/lib/jenkins/home /var/lib/jenkins/backup

    insinto /usr/lib/jenkins
    doins usr/lib/jenkins/jenkins.war

    newinitd "${FILESDIR}/init.sh" jenkins
    newconfd "${FILESDIR}/conf" jenkins

    fowners jenkins:jenkins /var/run/jenkins /var/log/jenkins /var/lib/jenkins /var/lib/jenkins/home /var/lib/jenkins/backup
}
