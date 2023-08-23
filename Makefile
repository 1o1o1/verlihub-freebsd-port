# New ports collection makefile for:	Verlihub
# Date created:				16.10.2022
# Whom:					Naumovitch Dmitry <admin@dchub.in.ua>
#
# $FreeBSD: ports/net-p2p/verlihub/Makefile,v 1.30 2018/19/06 07:33:12 ade Exp $
#

PORTNAME=	verlihub
PORTVERSION=	1.4.0.5
#PORTREVISION=	2
PORTEPOCH=	931
CATEGORIES=	net-p2p
MASTER_SITES=	https://github.com/Verlihub/verlihub/archive/

DISTNAME=	2b7edb22d2f42ea9c2159355a2163981dda68cf3

MAINTAINER=	netcelli@verlihub-project.org
COMMENT=	VerliHub is a Direct Connect protocol server (Hub)

WRKSRC=		${WRKDIR}/${PORTNAME}-2b7edb22d2f42ea9c2159355a2163981dda68cf3
LICENSE=	GPLv2

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	libmaxminddb.so:net/libmaxminddb \
		libpcre.so:devel/pcre

RUN_DEPENDS=	${BUILD_DEPENDS}

# fix your perl version:
#PERL_VER=	5.32
#PLIST_SUB=	PERL_VER=${PERL_VER}

USE_RC_SUBR=	verlihub
SUB_FILES=	verlihub
SUB_LIST=	PREFIX=${PREFIX}
USE_CMAKE=	yes
USE_MYSQL=	yes
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
#USE_GCC=	any

#WITHOUT_LUA=yes
#WITH_PYTHON=yes
#WITH_IPLOG=yes
#WITH_CHATROOM=yes
#WITH_FORBID=yes
#WITH_ISP=yes
#WITH_FLOODPROT=yes
#WITH_MESSENGER=yes
#WITH_REPLACER=yes
#WITH_PERL=yes
#WITH_STATS=yes

#post-patch:
#	@${INPLACE_CMD} cp files/FindLua54.cmake ${WRKSRC}/cmake/Modules/FindLua54.cmake

# Clang90
#CC=		/usr/local/bin/clang90
#CXX=		/usr/local/bin/clang++90
#CPP=		/usr/local/bin/clang-cpp90
#LD=		/usr/local/bin/ld.lld90
#NM=		/usr/local/bin/llvm-nm90
#OBJDUMP=	/usr/local/bin/llvm-objdump90
#STRINGS=	/usr/local/bin/llvm-strings90

USES=			cmake zip
#USES=			cmake:noninja zip

#OPTIONS_DEFINE=LUA PYTHON IPLOG CHATROOM FORBID ISP FLOODPROT MESSENGER REPLACER PERL STATS
#OPTIONS_DEFAULT=LUA PYTHON

#LUA_DESC=Load scripts written in LUA language
#PYTHON_DESC=Use scripts written with Python
#IPLOG_DESC=Save log history for IP and nicknames
#CHATROOM_DESC=Create individual chatrooms
#FORBID_DESC=Filter messages for forbidden words
#ISP_DESC=Check connection, nicknames, minimum shares, etc
#FLOODPROT_DESC=more control for hub flooding
#MESSENGER_DESC=Sends a message to offline users
#REPLACER_DESC=Replaces given patterns in text
#PERL_DESC=Use scripts written with Perl
#STATS_DESC=Periodically saves statistics in the DB

#OPTIONS=	CHATROOM "Create individual chatrooms" Off \
#		FORBID  "Filter messages for forbidden words" Off \
#		IPLOG "Save log history for IP and nicknames" On \
#		ISP "Check connection, nicknames, minimum shares, etc" Off \
#		LUA "Load scripts written in LUA language" On \
#		FLOODPROT "more control for hub flooding" Off \
#		MESSENGER "Sends a message to offline users" Off \
#		PYTHON "Use scripts written with Python" On \
#		REPLACER "Replaces given patterns in text" On \
#		STATS "Periodically saves statistics in the DB" Off

.include <bsd.port.options.mk>

CMAKE_ARGS+=	-DUSE_CUSTOM_AUTOSPRINTF:BOOL=ON

#CPPFLAGS+=	-DCMAKE_CXX_STANDARD=98

#CMAKE_ARGS+=	-DCMAKE_CXX_STANDARD=98

#CMAKE_ARGS+=	-DUSE_CUSTOM_AUTOSPRINTF=ON

#CMAKE_ARGS+=	-DU_USING_ICU_NAMESPACE=1

#CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1

#CMAKE_OUTSOURCE=1

.if defined(WITH_CHATROOM)
CMAKE_ARGS+=	-DWITH_CHATROOM=ON
.endif
.if defined(WITH_FORBID)
CMAKE_ARGS+=	-DWITH_FORBID=ON
.endif
.if defined(WITH_IPLOG)
CMAKE_ARGS+=	-DWITH_IPLOG=ON
.endif
.if defined(WITH_ISP)
CMAKE_ARGS+=	-DWITH_ISP=ON
.endif
.if defined(WITH_FLOODPROT)
CMAKE_ARGS+=	-DWITH_FLOODPROT=ON
.endif
.if defined(WITHOUT_LUA)
CMAKE_ARGS+=	-DWITH_LUA=OFF
.else
USE_LUA=	5.4
.endif
.if defined(WITH_MESSENGER)
CMAKE_ARGS+=	-DWITH_MESSENGER=ON
.endif
.if defined(WITH_PYTHON)
CMAKE_ARGS+=	-DWITH_PYTHON=ON
.else
USE_PYTHON=	2.8
.endif
.if defined(WITH_REPLACER)
CMAKE_ARGS+=	-DWITH_REPLACER=ON
.endif
.if defined(WITH_PERL)
CMAKE_ARGS+=	-DWITH_PERL=ON
.endif
.if defined(WITH_STATS)
CMAKE_ARGS+=	-DWITH_STATS=ON
.endif

post-install:
	@${ECHO_MSG} " You are now ready to use VerliHub into your system."
	@${ECHO_MSG} " Please report all bugs to http://www.verlihub-project.org/bugs"
	@${ECHO_MSG} " "
	@${ECHO_MSG} " Now you could use deamon editing config file /etc/rc.conf."
	@${ECHO_MSG} " Check config var in init file. Then start VerliHub daemon using"
	@${ECHO_MSG} " ${PREFIX}/etc/rc.d/verlihub start"
	@${ECHO_MSG} " "
	@${ECHO_MSG} " If you need help you can read the manual at"
	@${ECHO_MSG} " https://github.com/verlihub/verlihub/wiki or ask on support Hub:"
	@${ECHO_MSG} " nmdcs://hub.verlihub.net:7777"
	@${ECHO_MSG} " "
	@${ECHO_MSG} " You need to configure verlihub before starting it."
	@${ECHO_MSG} " Use vh -i to install To help you use vh -h"
	@${ECHO_MSG} " If you alread do tht please skip this step."
	@${ECHO_MSG} " "
	@${ECHO_MSG} " If you are updating verlihub from version < 1.0 you need"
	@${ECHO_MSG} " to run migration script for each of your installed hubs:"
	@${ECHO_MSG} " vh_migration_0.9.8eto1.0. Please follow the instructions"
	@${ECHO_MSG} " in the script"

.include <bsd.port.mk>
