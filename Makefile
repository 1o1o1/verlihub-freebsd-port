# New ports collection makefile for:	Verlihub
# Date created:				11.07.2020
# Whom:					Naumovitch Dmitry <admin@dchub.in.ua>
#
# $FreeBSD: ports/net-p2p/verlihub/Makefile,v 1.30 2018/19/06 07:33:12 ade Exp $
#

PORTNAME=	verlihub
PORTVERSION=	1.3.0.11
#PORTREVISION=	icu57
PORTEPOCH=	859
CATEGORIES=	net-p2p
MASTER_SITES=	https://github.com/Verlihub/verlihub/archive/

DISTNAME=	d8c8443ff9eb989b9d1f4fe2f9ee339b1694dfc7

MAINTAINER=	netcelli@verlihub-project.org
COMMENT=	VerliHub is a Direct Connect protocol server (Hub)

WRKSRC=		${WRKDIR}/${PORTNAME}-d8c8443ff9eb989b9d1f4fe2f9ee339b1694dfc7
LICENSE=	GPLv2

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	libmaxminddb.so:net/libmaxminddb \
		libpcre.so:devel/pcre

RUN_DEPENDS=	${BUILD_DEPENDS}

# fix your perl version:
PERL_VER=	5.32
PLIST_SUB=	PERL_VER=${PERL_VER}

USE_RC_SUBR=	verlihub
SUB_FILES=	verlihub
SUB_LIST=	PREFIX=${PREFIX}
USE_CMAKE=	yes
USE_MYSQL=	yes
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
#USE_GCC=	any

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


#OPTIONS=	CHATROOM "Create individual chatrooms" On \
#		FORBID  "Filter messages for forbidden words" On \
#		IPLOG "Save log history for IP and nicknames" On \
#		ISP "Check connection, nicknames, minimum shares, etc" On\
#		LUA "Load scripts written in LUA language" On \
#		FLOODPROT "more control for hub flooding" On \
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
#.if !defined(WITHOUT_NLS)
#USE_GETTEXT=	yes
#.endif
#.if defined(WITHOUT_CHATROOM)
#CMAKE_ARGS+=	-DWITH_CHATROOM:BOOL=OFF
#.endif
#.if defined(WITHOUT_FORBID)
#CMAKE_ARGS+=	-DWITH_FORBID:BOOL=OFF
#.endif
#.if defined(WITHOUT_IPLOG)
#CMAKE_ARGS+=	-DWITH_IPLOG:BOOL=OFF
#.endif
#.if defined(WITHOUT_ISP)
#CMAKE_ARGS+=	-DWITH_ISP:BOOL=OFF
#.endif
#.if defined(WITHOUT_FLOODPROT)
#CMAKE_ARGS+=	-DWITH_FLOODPROT:BOOL=OFF
#.endif
#.if defined(WITHOUT_LUA)
#CMAKE_ARGS+=	-DWITH_LUA:BOOL=OFF
#.else
#USE_LUA=	5.3
#.endif
#.if defined(WITHOUT_MESSENGER)
#CMAKE_ARGS+=	-DWITH_MESSENGER:BOOL=OFF
#.endif
#.if defined(WITHOUT_PYTHON)
#CMAKE_ARGS+=	-DWITH_PYTHON:BOOL=OFF
#.else
#USE_PYTHON=	2.8
#.endif
#.if defined(WITHOUT_REPLACER)
#CMAKE_ARGS+=	-DWITH_REPLACER:BOOL=OFF
#.endif
#.if defined(WITHOUT_STATS)
#CMAKE_ARGS+=	-DWITH_STATS:BOOL=OFF
#.endif

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
