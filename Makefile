obj-m := toggle.o
ARCH=arm

CROSS_COMPILE=/opt/poky-atmel/2.4.4/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-
#CROSS_COMPILE=/home/pritesh/Projects/Theatro_Labs/Alpha_git/communicator3/build/tmp/work/sama5d2_com3-poky-linux-gnueabi/linux-at91/4.9-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-


KERN_DIR = /home/trezen/Documents/linux-at91/

HOST_KERN_DIR = /lib/modules/$(shell uname -r)/build/

all:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERN_DIR) M=$(PWD) modules
clean:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERN_DIR) M=$(PWD) clean
	make -C $(HOST_KERN_DIR) M=$(PWD) clean
help:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERN_DIR) M=$(PWD) help
host:
	make -C $(HOST_KERN_DIR) M=$(PWD) modules
