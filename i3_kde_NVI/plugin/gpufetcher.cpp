#include "gpufetcher.h"

GPUFetcher::GPUFetcher(QObject *parent) : QObject(parent) {
    process = new QProcess();
}

GPUFetcher::~GPUFetcher() {
}

QString GPUFetcher::getGPUStr(){
    process->start("bash",QStringList() << "-c" << "prime-select query | awk \'{printf \"%s\",toupper(substr($1,1,1))tolower(substr($1,2,1))}\'");
    process->waitForFinished();
    /* qDebug() << process->program(); */
    result = QString(process->readAllStandardOutput());
    
    return result;
}
