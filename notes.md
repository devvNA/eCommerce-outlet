<!-- build.gradle : -->

buildscript {
// ext.kotlin_version = '1.8.22'
ext.kotlin_version = '1.8.10'
repositories {
google()
mavenCentral()
}

    dependencies {
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        // classpath 'com.android.tools.build:gradle:7.1.2'
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath 'com.google.gms:google-services:4.3.14'
    }

}

<!-- gradle-wrapper.properties -->

distributionUrl=https\://services.gradle.org/distributions/gradle-8.0-all.zip

<!-- key.properties -->

storePassword=android
keyPassword=android
keyAlias=upload
storeFile=C:\\Users\\devit\\upload-keystore.jks
