#ifndef GPU_FETCHER_H
#define GPU_FETCHER_H


#include <QObject>
#include <QProcess>

class GPUFetcher : public QObject
{
    Q_OBJECT

private:
    QString result;
    QProcess *process;

public:
    GPUFetcher( QObject *parent = 0);
    ~GPUFetcher();

public Q_SLOTS:
    QString getGPUStr();
};

#endif
