<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "notas_entrega".
 *
 * @property int $id
 * @property int $id_client
 * @property string $fecha
 * @property string $motivo
 * @property int $status
 *
 * @property Clientes $client
 * @property NotasEntregaDetail[] $notasEntregaDetails
 */
class NotasEntrega extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'notas_entrega';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_client', 'fecha', 'motivo'], 'required'],
            [['id_client', 'status'], 'integer'],
            [['fecha'], 'safe'],
            [['motivo'], 'string', 'max' => 400],
            [['id_client'], 'exist', 'skipOnError' => true, 'targetClass' => Clientes::className(), 'targetAttribute' => ['id_client' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_client' => 'Id Client',
            'fecha' => 'Fecha',
            'motivo' => 'Motivo',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(Clientes::className(), ['id' => 'id_client']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNotasEntregaDetails()
    {
        return $this->hasMany(NotasEntregaDetail::className(), ['id_not' => 'id']);
    }
}
