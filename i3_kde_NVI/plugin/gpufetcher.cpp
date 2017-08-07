#include "gpufetcher.h"

GPUFetcher::GPUFetcher(QObject *parent) : QObject(parent) {
    process = new QProcess();
}

GPUFetcher::~GPUFetcher() {
}

QString GPUFetcher::getGPUStr(){
    process->start("prime-select query");
    process->waitForFinished();
    result = QString(process->readAllStandardOutput());
    
    return result;
}
